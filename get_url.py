# modules we're using (you'll need to download lxml)
import lxml.html, urllib2, urlparse

# the url of the page you want to scrape
# base_url = 'http://www.renderx.com/demos/examples.html'
base_url = 'http://www.ffvvespaceaerien.org/?page_id=412'

# fetch the page
res = urllib2.urlopen(base_url)

# parse the response into an xml tree
tree = lxml.html.fromstring(res.read())

# construct a namespace dictionary to pass to the xpath() call
# this lets us use regular expressions in the xpath
ns = {'re': 'http://exslt.org/regular-expressions'}

# iterate over all <a> tags whose href ends in ".txt" (case-insensitive)
for node in tree.xpath('//a[re:test(@href, "\.txt$", "i")]', namespaces=ns):

    # print the href, joining it to the base_url
    print urlparse.urljoin(base_url, node.attrib['href'])

