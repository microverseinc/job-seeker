class RemoteOk
  def get_jobs
    open(url) do |rss|
      feed = RSS::Parser.parse(rss, false)
      filtered_items = feed.items.select do |item|
        item.pubDate.month == DateTime.now.month
      end

      filtered_items.map do |item|
        { source: "Remote OK", title: item.title.strip, publication_date: item.pubDate.to_s, url: item.link }
      end
    end
  end

  def url
    "https://remoteok.io/remote-jobs.rss"
  end
end
