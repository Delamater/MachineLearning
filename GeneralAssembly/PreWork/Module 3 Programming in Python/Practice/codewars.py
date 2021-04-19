# def even_or_odd(number):
#     return False if number % 2 else True

# def positive_sum(arr):
#     total = 0
#     for number in arr:
#         if number > 0:
#             total += number
#     return total

# def repeat_str(repeat, string):

#     return string * repeat

# def minimum(arr):
#     return min(arr)

# def maximum(arr):
#     return max(arr)

def find_needle(haystack):
    return "found the needle at position " + str(haystack.index("needle"))

# even_or_odd(1)
# even_or_odd(2)
# positive_sum([5,5,-5])
# repeat_str('Bob',40)
# minimum([1,2,3,4,5])
# maximum([1,2,3,4,5])
find_needle(["Bob", "Joe", "needle", "Billy"])