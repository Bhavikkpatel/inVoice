<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .invoice-container {
            max-width: 1000px;
            margin: 20px auto;
            margin-top: 0px;
            padding: 30px;
            padding-top: 0px;
            background: #fff;
            border-radius: 8px;
        }
        .header {
            text-align: center;
            border-bottom: 2px solid #007BFF;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
            color: #007BFF;
        }
        .invoice-info-row {
            display: flex;
            justify-content: space-between;
            background: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px 20px;
            margin-bottom: 20px;
            font-size: 16px;
        }
        .info-section {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-bottom: 20px;
        }
        .info-box {
            flex: 1;
            border: 1px solid #ddd;
            background: #f9f9f9;
            border-radius: 8px;
            padding: 20px;
        }
        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .items-table th, .items-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .items-table th {
            background: #f4f4f4;
        }
        .items-table tbody tr {
            page-break-inside: avoid;
        }
        .footer {
            text-align: center;
            font-size: 12px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="invoice-container">
        <!-- Header -->
        <div class="header">
            <h1>Invoice</h1>
            <p>{{companyName}}</p>
        </div>

        <!-- Invoice Information -->
        <div class="invoice-info-row">
            <div><strong>Invoice Number:</strong> {{invoiceNumber}}</div>
            <div><strong>Date:</strong> {{date}}</div>
        </div>

        <!-- Company and Receiver Information -->
        <div class="info-section">
            <div class="info-box">
                <p><strong>From:</strong></p>
                <p>{{fromAddress.name}},<br>{{fromAddress.street}},<br>{{fromAddress.city}}, {{fromAddress.state}}, {{fromAddress.pincode}}</p>
                <p>GSTIN: {{fromAddress.gstin}}</p>
            </div>
            <div class="info-box">
                <p><strong>Bill To:</strong></p>
                <p>{{toAddress.name}},<br>{{toAddress.street}},<br>{{toAddress.city}}, {{toAddress.state}}, {{toAddress.pincode}}</p>
                <p>GSTIN: {{toAddress.gstin}}</p>
            </div>
        </div>

        <!-- Items Table -->
        <table class="items-table">
            <thead>
                <tr>
                    <th>S. No</th>
                    <th>Item</th>
                    <th>Qty</th>
                    <th>Rate</th>
                    <th>Taxable Value</th>
                    <th>CGST</th>
                    <th>SGST</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                {{#items}}
                <tr>
                    <td>{{slNo}}</td>
                    <td>{{description}}</td>
                    <td>{{quantity}} {{unit}}</td>
                    <td>{{rate}}</td>
                    <td>{{taxableValue}}</td>
                    <td>{{cgst}}</td>
                    <td>{{sgst}}</td>
                    <td>{{total}}</td>
                </tr>
                {{/items}}
            </tbody>
        </table>

        <!-- Footer -->
        <div class="footer">
            <p>Total Invoice Value: ₹{{totalInvoiceValue}}</p>
            <p>Certified that the above price is actually charged by us, and there is no additional consideration over and above the charged price.</p>
        </div>
    </div>
</body>
</html>
