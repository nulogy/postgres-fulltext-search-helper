require_relative "../lib/postgres-fulltext-search-helper"

Helper = PostgresFulltextSearchHelper

describe PostgresFulltextSearchHelper do
  it "returns a string that can be used by postgres" do
    query = "hello"

    expect(Helper.format_query_for_fulltext(query)).to eq("(hello:* | -hello:*)")
  end

  it "whitespace is interpreted as &" do
    query = "hello world"

    expect(Helper.format_query_for_fulltext(query)).to eq("(hello:* | -hello:*) & (world:* | -world:*)")
  end

  it "handles sensitive characters" do
    query = "*:hello &(world)!|"
    expect(Helper.format_query_for_fulltext(query)).to eq("(hello:* | -hello:*) & (world:* | -world:*)")
  end

  it "adds a filter to a activerecord-style scope" do
    scope = stub("scope").as_null_object

    scope.should_receive(:where).with("to_tsvector('simple', name::text) @@ to_tsquery('simple', ?)", ["(hello:* | -hello:*) & (world:* | -world:*)"])

    Helper.search(scope, "name", "hello world")
  end
end
