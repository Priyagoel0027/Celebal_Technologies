# Week 4 Assignment – Azure Data Factory End-to-End Data Pipeline Using Azure Blob Storage

## Objective

The objective of this assignment is to understand Azure cloud services and implement an end-to-end data integration pipeline using Azure Blob Storage and Azure Data Factory (ADF). The workflow includes data ingestion, metadata validation, data movement, monitoring, and access management.

---

## Technologies Used

- Microsoft Azure
- Azure Resource Group
- Azure Blob Storage
- Azure Data Factory (ADF)
- Azure IAM
- Sample Superstore Dataset (CSV)

---

## Environment Details

| Component | Details |
|------------|----------|
| Cloud Platform | Microsoft Azure |
| Storage Service | Azure Blob Storage |
| Integration Service | Azure Data Factory |
| Dataset | Sample Superstore.csv |
| Source Container | superstore-data |
| File Format | CSV |

---

## Steps Performed

### 1. Resource Group Creation

A Resource Group was created in Azure Portal to organize and manage all resources used in this assignment.

### 2. Storage Account and Blob Container Setup

- Created an Azure Storage Account.
- Created a Blob Container named `superstore-data`.
- Uploaded the `Sample-Superstore.csv` dataset.

### 3. Azure Data Factory Creation

Azure Data Factory was created to design and manage the data pipeline.

The following components were explored:

- Author Hub
- Monitor Hub
- Manage Hub

### 4. Linked Service Configuration

A Linked Service was configured between Azure Data Factory and Azure Blob Storage.

**Result:**
- Connection Test Successful
- Blob Storage Connected Successfully

### 5. Dataset Creation

Created:

- Source Dataset
- Destination Dataset

Both datasets were validated successfully.

### 6. Metadata Validation

A Get Metadata activity was added to verify the source file before data transfer.

| Property | Value |
|-----------|---------|
| File Name | Sample-Superstore.csv |
| File Exists | True |
| File Type | CSV |
| Container | superstore-data |

### 7. Pipeline Development

The pipeline was developed using:

1. Get Metadata Activity
2. Copy Data Activity

#### Pipeline Flow

```text
Source Blob Storage
      ↓
Get Metadata Activity
      ↓
Copy Data Activity
      ↓
Destination Blob Storage
```

### 8. Pipeline Execution

The pipeline was executed using Debug/Trigger.

| Activity | Status |
|-----------|---------|
| Pipeline Run | Success |
| Metadata Activity | Success |
| Copy Activity | Success |
| Errors | 0 |

### 9. Monitoring and Validation

Pipeline execution was monitored through the Monitor Hub.

| Metric | Status |
|----------|---------|
| Pipeline Status | Succeeded |
| Activity Status | Succeeded |
| Data Transfer | Successful |

### 10. IAM Role Assignment

The following Azure IAM roles were configured:

- Reader
- Contributor
- Owner

These roles ensured secure communication between Azure Data Factory and Azure Storage Account.

---

## Output

- Dataset uploaded successfully to Azure Blob Storage.
- Metadata validation completed successfully.
- Data copied from source container to destination container.
- Pipeline executed successfully without errors.
- Monitoring confirmed successful execution.
- Access permissions were configured successfully.

---

## Conclusion

This assignment successfully demonstrated the implementation of an end-to-end Azure Data Pipeline using Azure Blob Storage and Azure Data Factory. The workflow covered resource creation, storage management, metadata validation, data transfer, monitoring, and access control. All activities executed successfully, validating the use of Azure services for cloud-based data integration.
