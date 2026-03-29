This codebook defines rules for tagging facts in LLM data analysis responses. We tag a fact using the <fact> tag. For instance, "the two rates are <fact>closely</fact> matched."

We consider a fact the minimal core element / the atomic unit of information derived from data. There are two reasons for this. First, one sentence can contain multiple facts. Tagging a sentence will likely collapse multiple facts into one. Second, when analyzing fact identification accuracy, we consider a ground-truth fact to be covered only when a <cite> / <error> tag completely covers a ground-truth fact. Reducing the span of a <fact> tag could help avoid false negatives.

Here are the codes for tagging a fact:

1. Numbers

These include counts, percentages, durations and any other numbers derived from the data.

- Counts: e.g., <fact>3,834</fact> sessions reached checkout, there were <fact>10,000</fact> total sessions
- Percentages: e.g., representing <fact>38.34%</fact> of total sessions, a conversion rate of <fact>56.28%</fact>
- Durations: average resolution time of <fact>55.53 hours</fact>, takes <fact>2 minutes</fact> on average

2. Qualitative comparisons

These include rankings, superlatives, relative terms, and comparatives:

- Rankings: e.g., most common, highest
- Superlatives: e.g., least, smallest
- Relative terms: e.g., closely, significant
- Comparatives: e.g., higher, more frequent

Here are some instructions for when we should not tag a piece of information as a fact:

1. For numbers with qualifier prefixes ("approximately", "nearly", "about", "over", "under", "more than", "less than"), tag ONLY the number, not the qualifier. E.g.,
	- CORRECT: approximately <fact>17.43%</fact> of browsing activity
	- WRONG: <fact>approximately 17.43%</fact> of browsing activity

2. Don't tag the same fact twice.

For example, in "electronics is the least browsed category on mobile at 25.31%," both "least" (qualitative comparison) and "25.31%" (number) can be cited. Prioritize tagging numbers when both can be cited. So, the idea is that qualitative comparisons should be tagged only if numbers for the same claim has not been tagged.

3. Don't tag broad claims.

For example, "what's most interesting about this store is the remarkable consistency of user behavior." This claims requires multiple pieces of evidence to support. Details will likely be provided the following this broad claim. Such details should be cited instead.

4. We do not consider these as data-derived facts:

	- Methodology: "I will analyze...", "Let me look at..."
	- Restatements of the question
	- Category names: "Books", "organic", "Emily", "mobile"
	- Event names: "WIP - level 1 support", "Ticket assigned to level 2 support", "Level 1 escalates to level 2 support"
	- Event patterns or sequences: "page_view -> add_to_cart", "WIP - level 2 support → Ticket solved by level 2 support"

We don't tag categories, patterns, or sequences because these are usually part of a claim that have numbers / qualitative comparisons. Since we have already tagged the numbers / qualitative comparisons within claim, tagging the categories, patterns, or sequences will be a duplication.
