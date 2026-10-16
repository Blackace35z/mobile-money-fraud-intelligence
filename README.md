# Mobile Money Fraud Intelligence

## Project Overview

This project investigates fraudulent transactions in a mobile money system using exploratory data analysis (EDA), SQL analysis, and machine learning. The goal is to identify transaction patterns associated with fraud, evaluate fraud detection models, and translate the results into practical recommendations for fraud monitoring.

## Business Problem

Mobile money providers need to detect suspicious transactions while minimizing false alarms that create unnecessary work for fraud investigation teams. Because fraudulent transactions are rare, evaluating a detection system requires more than overall accuracy.

## Dataset

- **Source:** [PaySim Synthetic Financial Dataset](https://www.kaggle.com/datasets/ealaxi/paysim1)
- **Transactions:** 6,362,620
- **Fraudulent transactions:** 8,213
- **Fraud prevalence:** Approximately 0.129%
- **Data type:** Synthetic mobile money transactions

The raw dataset is not included in this repository. Download it from the source above and place the CSV file in the `data/` directory.

Expected filename: `PS_20174392719_1491204439457_log.csv`

## Methods

- Exploratory data analysis using pandas, Matplotlib, and Seaborn
- Analysis of fraud prevalence, transaction types, transaction amounts, and temporal patterns
- Feature selection with attention to prediction-time data leakage
- Chronological train/test split to evaluate performance on later transactions
- Decision Tree and Logistic Regression models
- Evaluation using precision, recall, F1-score, Average Precision, and ROC-AUC
- Threshold analysis to examine the trade-off between missed fraud and false alarms
- Model interpretation using feature importance and permutation importance

## Key Findings

- Fraud represents approximately 0.129% of transactions, creating a severe class-imbalance problem.
- In this dataset, fraud labels occur in `TRANSFER` and `CASH_OUT` transactions.
- The fraud rate in the chronological test period was approximately 4.22 times the rate in the training period, highlighting substantial temporal variation.
- The Decision Tree achieved an Average Precision of approximately 0.656 and fraud recall of approximately 88.7% at the default classification threshold.
- Increasing the Decision Tree threshold to 0.9 reduced alerts substantially but also increased the number of missed fraudulent transactions.
- Feature importance and permutation importance highlighted transaction amount and origin balance as useful predictors in this experiment.

## Business Recommendations

1. Prioritize risk-based monitoring and investigate suspicious transactions rather than treating model predictions as proof of fraud.
2. Choose alert thresholds based on the relative cost of missed fraud and false alarms.
3. Monitor changes in fraud patterns and model performance over time.
4. Evaluate the approach on multiple time periods and, where possible, real operational data before deployment.

## Project Structure

```text
mobile-money-fraud-intelligence/
├── data/                  # Local dataset (not committed)
├── notebooks/             # Exploratory analysis and modeling
├── sql/                   # SQL analyses
├── src/                   # Reusable Python code
├── reports/               # Reports and outputs
├── .gitignore
├── requirements.txt
└── README.md
```

## Setup

1. Clone or download this repository.
2. Create and activate a Python virtual environment.
3. Install dependencies:

   ```bash
   python -m pip install -r requirements.txt
   ```

4. Download the PaySim dataset from the source linked above.
5. Place the CSV file in the `data/` directory.
6. Open `notebooks/01_data_exploration.ipynb` in Jupyter or VS Code.

## Limitations

- PaySim is synthetic data, so these results do not establish expected performance on real mobile money transactions.
- Fraud patterns vary over time, and the test period had a higher fraud prevalence than the training period.
- Alert thresholds require business-cost analysis, and model probabilities should not be assumed to be calibrated.
- Feature importance indicates predictive usefulness in this experiment, not causation.
- The SQL analysis and dashboard components may be developed as subsequent project stages.

## Tools

Python, pandas, NumPy, Matplotlib, Seaborn, scikit-learn, Jupyter Notebook, SQL, Git, and GitHub.

## Power BI Dashboard

An interactive Power BI dashboard was developed to explore fraud patterns in the PaySim mobile-money transaction dataset.

**Dashboard features**
- KPI cards for total transactions, fraud-labeled transactions, and overall fraud rate.
- Fraud counts by transaction type.
- Fraud activity over simulation time.
- Comparison of fraud cases across the first and second halves of the simulation.
- Interactive slicers for transaction type and time period.

**Files**
- Power BI report: `reports/mobile_money_fraud_dashboard.pbix`
- Aggregated dashboard data: `reports/powerbi_dashboard_data.csv`
- SQL query used to generate the data: `sql/06_powerbi_dashboard_data.sql`

To view the dashboard, download the `.pbix` file and open it in Power BI Desktop. The dataset is synthetic, so the findings should not be interpreted as guaranteed performance on real-world financial transactions.