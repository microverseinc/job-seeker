class WeWorkRemotely
  def get_jobs
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      filtered_items = feed.items.select do |item|
        item.pubDate.day == DateTime.now.day
      end

      filtered_items.map do |item|
        {
          description: item.description,
          source: "We Work Remotely",
          title: item.title,
          publication_date: item.pubDate.to_s,
          url: item.link
        }
      end
    end
  end

  private

  def url
    "https://weworkremotely.com/categories/remote-programming-jobs.rss"
  end
end
