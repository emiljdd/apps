# Inventory Item Similarity App

A local Streamlit application that creates a unique item-number inventory summary, aggregates QTY On Hand, filters quantities, identifies similar item numbers, highlights review records, and exports Excel or CSV results.

## Windows setup

1. Install Python 3.10 or later.
2. Extract this package to a folder.
3. Double-click `run_app.bat`.
4. The app opens in your browser, normally at `http://localhost:8501`.

## Manual startup

```bash
pip install -r requirements.txt
streamlit run app.py
```

## Editable parameters

- Source Excel/CSV file
- Worksheet
- Header row
- Item-number and quantity columns
- Quantity aggregation: sum, maximum, minimum, average, or first
- Quantity filter: exclude zero, positive only, negative only, or all
- Blank quantity handling
- Item trimming and case-sensitive grouping
- Similarity threshold
- Similarity method
- Minimum item-number length
- Whether to ignore capitalization, spaces, hyphens, punctuation, and leading zeros
- Output file name
- Highlight color
- Preview row count

## Output

The Excel download contains:

- **Item Summary**: unique item numbers, aggregated quantity, closest match, similarity percentage, and review flag
- **Settings**: all parameters used for the run
