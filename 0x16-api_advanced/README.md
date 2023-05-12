# API (Advanced)
## API Documentation
Think of API documentation as a treasure map, and endpoints are the "X" marks the spot! They're the place where the gold (data) resides. Much like a treasure map, the API documentation guides you: it reveals the secret paths (endpoints), the magic words (request methods like GET, POST, PUT, DELETE), and what treasures you might find (response formats). It's a thrilling adventure each time you embark on a journey to find the endpoint you're looking for! API documentation provides information on how to interact with an API. Endpoints usually follow a logical naming convention related to their function.

## Using an API with Pagination
Ever felt like a superhero racing against the clock? That's API Pagination! APIs are like a series of comic books; you can't get all the stories (data) in one edition (request). So, you keep turning the pages (making successive requests) until you've read all the tales! Each response comes with a cliffhanger - a link for the next page. The mission isn't complete until you've gone through all the pages! APIs often limit the amount of data returned in a single request for performance reasons. To access all data, APIs use pagination. Typically, the response will contain a link or key for the next page. It's necessary to make successive requests, updating the page parameter each time, until all data is retrieved.

## Parsing JSON Results from an API
Imagine if you could understand the language of aliens? That's JSON! APIs often speak in this alien language, JSON, a string of symbols and text that seems unintelligible. But fear not! Python's json module is your universal translator, converting this alien language into a friendly, earthly Python data structure. With json.loads(), you're the universal linguist! APIs commonly return data in JSON format. In Python, you can use the `json` module to parse this data. The `json.loads()` function converts a JSON string into a Python data structure (like a dictionary or list), allowing you to interact with the data in a more native format.

## Making a Recursive API Call
Remember the movie Inception, where there are dreams within dreams? That's Recursive API calls for you! When one layer of data isn't enough, and you need to dig deeper through multiple layers of an API's response, you need to dream a little bigger. Just like navigating through dream layers, you make an API call within a loop, venturing deeper into the data dream until you hit the bedrock. A recursive API call is used when you need to dig through multiple layers of an API's response. For example, if an API endpoint returns a list of resources, each with its own ID, and you need to retrieve detailed data for each resource via another endpoint, you'd use a recursive call. It involves making an API call within a loop or recursive function, which loops over the initial response.

## Sorting a Dictionary by Value
Ever watched a race and wondered who came first, second, and third? That's what sorting a dictionary by value is like! The dictionary's values are the sprinters, and Python's `sorted()` function is your race official. With a wave of the `lambda` function, the race is on, and the dictionary values vie for their positions, lining up in ascending order at the finish line. It's a thrilling event every time you sort!
In Python, you can sort a dictionary by value using the built-in `sorted()` function in combination with the `lambda` function. Here's an example:
```
dict = {'item1': 5, 'item2': 3, 'item3': 4}
sorted_dict = dict(sorted(dict.items(), key=lambda item: item[1]))
```
In this example, `sorted_dict` will be a new dictionary sorted by values in ascending order. The `key` parameter of the `sorted()` function specifies a function of one argument that is used to extract a comparison key from each element in the list (`item[1]` refers to the dictionary values).


This project explores APIs by using the [Reddit API](https://www.reddit.com/dev/api/).

## Task files description:

  * [0-subs.py](./0-subs.py): Python function that returns the total number of
  subscribers for a given subreddit.
  * Returns `0` if an invalid subreddit is given.

  * [1-top_ten.py](./1-top_ten.py): Python function that prints the top ten
  hottest posts for a given subreddit.
  * Prints `None` if an invalid subreddit is given.

  * [2-recurse.py](./2-recurse.py): Python function that recursively returns a
  list of titles for all hot articles on a given subreddit.
  * Returns `None` if no results are found on the given subreddit.

  * [100-count.py](./100-count.py): Python function that recursively prints a
  sorted count of given keywords parsed from titles of all hot articles on a given
  subreddit.
  * Keywords are case-insensitive and delimited by spaces.
  * Results are printed in descending order by count.
  * Words with identical counts are sorted alphabetically.
  * Words with no matches are skipped.
  * Results are based on the number of times a keyword appears - ie.,
  `java java java` counts as three separate instances of `java`.
