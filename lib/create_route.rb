def post_create_route_data(conn, api_url)
    
    delivery_date = Time.parse('06/08/2024') 

    route_data = [
        {
            "dateForDelivery": delivery_date.strftime('%d/%m/%Y'),
            "comments": "",
            "initialAmount": 1000.0,
            "products": [
                {
                "product": "ACME-01-003",
                "quantity": 30
                },
                {
                "product": "ACME-03-008",
                "quantity": 30
                },
                {
                "product": "ACME-02-006",
                "quantity": 30
                },
                {
                "product": "ACME-01-002",
                "quantity": 30
                }
            ]
        }
    ]

    route_data.each do |data|
        post_data(conn, "#{api_url}/user/88852/route", data)
        sleep(1)
    end
end