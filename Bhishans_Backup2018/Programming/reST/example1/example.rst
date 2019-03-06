.. include:: common.rsti

.. |some_text| replace:: Long bit of text to replace easily
.. |inline-image-stuff| image:: ../_static/stuff.png

Title text
----------

.. toctree::
   :maxdepth: 2

   some-other-file

Here is *some* text. :ref:`label-stuff` describes **more** stuff |inline-image-stuff|.

User input would look like ``tappity tappity``.

An inline link looks like `This <http://www.example.com>`_, while an explicit external link looks like `Some external link`_

.. _label-stuff:

More Stuff
~~~~~~~~~~

More stuff here, and see figure :ref:`figure-blah` to see stuff [#f1]_.

.. note:: I like stuff.

I am lazy, so I like to find ways to save typing, especially for a |some_text|.

.. _figure-blah:
.. figure:: ../_static/blah.png
    :figclass: align-center

    Stuff to see

* This is a bulleted list
* And another list item
* One more
* Last one I promise

# This would be an ordered list
# And another line for an ordered list
# Third time is the charm

.. seealso:: In :doc:`some-other-file`, other files are discovered.

.. _Some external link: http://www.example.com

.. rubric:: Footnotes

.. [#f1] Footnote for stuff.
