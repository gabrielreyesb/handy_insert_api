def post_sales_orders(conn, api_url)

    start_time = Time.parse('09/07/2024 10:10:00') 
    end_time = start_time + 30 * 60

    sales_orders = [
        {
            "mobileDateCreated": "09/07/2024 12:00:00",
            "items": [
                { product: 'ACME-01-003', quantity: 4, price: 50 },
                { product: 'ACME-01-001', quantity: 1, price: 90 }
            ],
            "customer": "CTE0102"
        },
        {
            "mobileDateCreated": "09/07/2024 12:03:00",
            "items": [
                { product: 'ACME-01-003', quantity: 2, price: 50 },
                { product: 'ACME-01-001', quantity: 2, price: 90 }
            ],
            "customer": "CTE0109"
        },
        {
            "mobileDateCreated": "09/07/2024 12:07:00",
            "items": [
                { product: 'ACME-01-003', quantity: 2, price: 50 },
                { product: 'ACME-01-001', quantity: 2, price: 90 },
                { product: 'ACME-02-004', quantity: 2, price: 100 }
            ],
            "customer": "CTE0087"
        },
        {
            "mobileDateCreated": "09/07/2024 12:10:00",
            "items": [
                { product: 'ACME-02-005', quantity: 4, price: 50 },
                { product: 'ACME-03-009', quantity: 1, price: 90 }
            ],
            "customer": "CTE0100"
        },
        {
            "mobileDateCreated": "09/07/2024 12:15:00",
            "items": [
                { product: 'ACME-02-005', quantity: 10, price: 50 }
            ],
            "customer": "CTE0108"
        },
        {
            "mobileDateCreated": "09/07/2024 12:20:00",
            "items": [
                { product: 'ACME-01-003', quantity: 1, price: 50 },
                { product: 'ACME-01-001', quantity: 2, price: 90 },
                { product: 'ACME-02-005', quantity: 10, price: 50 }
            ],
            "customer": "CTE0115"
        },
        {
            "mobileDateCreated": "09/07/2024 12:32:00",
            "items": [
                { product: 'ACME-03-009', quantity: 20, price: 80 }
            ],
            "customer": "CTE0105"
        },
    ]
    sales_orders.each do |data|
        data["orderItems"] = data.delete("items")
        data["customerId"] = data.delete("customer")
        post_data(conn, "#{api_url}/salesOrder", data)
        sleep(1)
    end
end