window.onload = function () {
	let quotes = [
		"If you're gonna be dumb, you gotta be tough",
		"Effort spent is never effort wasted",
		"It's your life; live it",
		"I love it... I hate it... I would burn the whole thing down and build something exactly like it."
	];

	function getQuote() {
		let count = quotes.length;
		let entry = Math.floor(Math.random() * count);
		return quotes[entry];
	}

	let quoteBlock = document.getElementById("quotes");
	quoteBlock.innerText = getQuote();
};
