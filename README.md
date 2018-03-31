# traceroute-graph
Simple script to generate a graphical representation of a traceroute

# Output Examples

![Netflix](/examples/netflix.com.jpg)

![Google](/examples/google.ca.jpg)

![JPRS](/examples/jprs.co.jp.jpg)

# Usage

```
traceroute google.ca | awk -f ./traceroute-graph.awk | dot -Tjpg > /tmp/traceroute.jpg 
```

If you have imagemagick installed:

```
traceroute google.ca | awk -f ./traceroute-graph.awk | dot -Tjpg | display -
```
