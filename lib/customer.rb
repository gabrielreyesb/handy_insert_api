def post_customer(conn, api_url)
    data = { 
        code: 'C00010',
        description: 'Customer number 10',
        zone: '327625'
    }
    post_data(conn, "#{api_url}/customer", data)
end