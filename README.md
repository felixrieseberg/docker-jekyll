# Small Jekyll Docker Container (with Extras)
A small Docker image with Jekyll (with a few added extras). Created to automatically build a GitHub Page, which is then uploaded via ncftp. 

* Github Pages
* Kramdown
* RDiscount
* Rouge
* Pygments Syntax Highlighting
* Jekyll "Redirect From"
* Jekyll Sitemaps
* ncftp
* Node.js

```
sudo docker run --rm -v "$PWD:/myJekyllPage" felixrieseberg/jekyll build
```

Or, just use the Docker image as your local Jekyll installation. First, set an alias:
```
alias jekyll='sudo docker run --rm -v "$PWD:/src" -p 4000:4000 felixrieseberg/jekyll'
```

And then use it like a normal Jekyll binary:

```
jekyll build
jekyll serve -H 0.0.0.0
```

### License
MIT. For more details, please see the `LICENSE` file.