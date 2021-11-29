# ruby_knights_travails

This repository contains my solution for the [Knight's Travails lesson](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/knights-travails) from
The Odin Project.

This project challenged me a lot in terms of the implementation side. I think
conceptually, working with the graph was pretty straight forward, but I got
stuck a few times on the actual implementation.

The first major roadblock was how to implement the edges, and I think my hunch
initially was right in using node neighbours, but I initally implemented them
using a graph#find method which returned the actual node to add into the neigh-
bours instance variable, which ended up being a mistake. Around d2, the
reference list was so long and nested Ruby ended up killing the process before
even completing the graph. At this point, I took a break, and then came back
and ended up storing the name of the node (ie, 'e2') rather than the node
object. This solved the problem, and I was able to build a complete graph.

The second roadblock was trying to figure out the exact details of BF search.
Having completed the binary search, I had a good basis to start, but really had
a hard time initially figuring out how to manage the information about distance
and predecessors. The Khan Academy link in the lesson was helpful here, and I
eventually settled on a hash with the name of the node as the key.

An additional wrinkle I had was sorting out how to calculate the "distance"
attribute properly. The trick was displaying the bfs_info and seeing that my
distance was all whacky (at one point, I had values of 32 for nodes 4 steps
away from the parent...). I think I could have implemented it without if/else
but I was so close I wanted to just wrap up the project and move on. Especially
because my output array was correct, and I could have calculated the "move
number" from that (in fact, I do just that), but I wanted to make sure that the
search was also returning the right number in case I wanted to use it down the
line.

All in all, this project was a challenge, but I am glad I kept chipping away at
it, because getting it working felt amazing.

# TODO
This project was fun, and it was a really interesting introduction to graphs
and graph theory in computer science.
* Consider doing other representations of the graph and implementing search for
those types of graphs.
* Consider how we might do knight's tour based on this code.