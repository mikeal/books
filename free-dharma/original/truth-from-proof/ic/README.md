# ic

1. Take the sequence of random numbers and convert to a tuple of [ position, value ] and then sort them by value.
2. Delta compress the sorted list of tuples.
3. Calculate the mean delta.
4. Arrange the Delta tuples into two lists, one for each side of the mean delta. Push the position in the secondary list to the value.
5. Run another delta on both lists.
6. Take the original and secondary positions and convert to a binary reprentation of the movement in position in the list.

to reverse:

1. Reverse the delta on both lists.
2. Decode the movement into original and secondary positions.
3. Move the values into the secondary list.
4. Reverse the delta on the secondary list.
5. Move the values back into the original list positions.
