require "postgres-fulltext-search-helper/version"

module PostgresFulltextSearchHelper
  extend self

  POSTGRES_TSQUERY_SENSITIVE_CHARACTERS = /[|&!():\* ]/

  def format_query_for_fulltext(query)
    parts = query.split(POSTGRES_TSQUERY_SENSITIVE_CHARACTERS).delete_if{|x| x.strip.empty? }
    return parts.map{|token| token + ':*'}.join(' & ')
  end
end
