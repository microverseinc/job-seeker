class StackOverflow
  def get_jobs
    open(url) do |rss|
      feed = RSS::Parser.parse(rss, false)
      filtered_items = feed.items.select do |item|
        item.pubDate.day == DateTime.now.day
      end

      filtered_items.map do |item|
        {
          description: item.description,
          source: "Stack Overflow",
          title: item.title.strip,
          publication_date: item.pubDate.to_s,
          url: item.link
        }
      end
    end
  end

  def url
    "https://stackoverflow.com/jobs/feed"
  end
end
