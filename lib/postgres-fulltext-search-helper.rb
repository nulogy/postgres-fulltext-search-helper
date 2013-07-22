require "postgres-fulltext-search-helper/version"

module PostgresFulltextSearchHelper
  extend self

  POSTGRES_TSQUERY_SENSITIVE_CHARACTERS = /[|&!():\* ]/

  def format_query_for_fulltext(query)
    parts = query.split(POSTGRES_TSQUERY_SENSITIVE_CHARACTERS).delete_if{|x| x.strip.empty? }
    return parts.map{|token| "(#{token}:* | -#{token}:*)" }.join(' & ')
  end

  def search(scope, field_name, query)
    return scope.where("to_tsvector('simple', #{field_name}::text) @@ to_tsquery('simple', ?)", [format_query_for_fulltext(query)])
  end
end
