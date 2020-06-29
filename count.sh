# Extract Sentiment Columns to Text File
awk -F ',' '{print $NF}' imdb_dataset.csv > sentiment.txt

# Count numbers of positive value
positive_count="$(grep -c positive sentiment.txt)"

# Count number of negative value
negative_count="$(grep -c negative sentiment.txt)"

# Count number of unique words
unique_words="$(cat imdb_dataset.csv| sed -e 's/<[^>]*>//g' | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr '[:space:]' '[\n*]' | sort | uniq -c | awk -F ' ' '{if($2 ~ /^[A-Za-z0-9]/) print $2}' | wc -l)"

# Display Result
echo "Positive Count = $positive_count"
echo "Negative Count = $negative_count"
echo "Total Unique Words = $unique_words"

