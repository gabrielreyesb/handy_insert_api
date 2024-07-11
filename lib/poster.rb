def post_data(conn, full_url, data)
    payload = JSON.generate(data)
    begin
        response = conn.post(full_url) do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = payload
    end
    if response.success?
        puts "POST request successful!"
    else
        puts "POST request failed. Status: #{response.status}"
        puts "Response body: #{response.body}"
    end
    rescue Faraday::Error => e
        puts "Error: #{e.message}"
    end
end