def post_sales_orders(conn, api_url)

    start_time = Time.parse('05/08/2024 10:00:00') 

    sales_orders = [
        {
            "mobileDateCreated": start_time.strftime('%d/%m/%Y %H:%M:%S'),
            "items": [
                { product: 'ACME-01-003', quantity: 4, price: 50 },
                { product: 'ACME-03-008', quantity: 1, price: 90 }
            ],
            "customer": "CTE0102"
        },
        {
            "mobileDateCreated": start_time.strftime('%d/%m/%Y %H:%M:%S'),
            "items": [
                { product: 'ACME-02-006', quantity: 2, price: 50 },
            ],
            "customer": "CTE0109"
        },
        {
            "mobileDateCreated": start_time.strftime('%d/%m/%Y %H:%M:%S'),
            "items": [
                { product: 'ACME-01-003', quantity: 2, price: 50 },
                { product: 'ACME-01-002', quantity: 2, price: 90 },
                { product: 'ACME-02-006', quantity: 2, price: 100 }
            ],
            "customer": "CTE0087"
        },
        {
            "mobileDateCreated": start_time.strftime('%d/%m/%Y %H:%M:%S'),
            "items": [
                { product: 'ACME-02-006', quantity: 4, price: 50 },
                { product: 'ACME-01-002', quantity: 1, price: 90 }
            ],
            "customer": "CTE0100"
        },
        {
            "mobileDateCreated": start_time.strftime('%d/%m/%Y %H:%M:%S'),
            "items": [
                { product: 'ACME-02-006', quantity: 10, price: 50 }
            ],
            "customer": "CTE0108"
        },
        {
            "mobileDateCreated": start_time.strftime('%d/%m/%Y %H:%M:%S'),
            "items": [
                { product: 'ACME-01-003', quantity: 1, price: 50 },
                { product: 'ACME-01-002', quantity: 2, price: 90 },
                { product: 'ACME-02-006', quantity: 10, price: 50 }
            ],
            "customer": "CTE0115"
        },
        {
            "mobileDateCreated": start_time.strftime('%d/%m/%Y %H:%M:%S'),
            "items": [
                { product: 'ACME-03-008', quantity: 20, price: 80 }
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