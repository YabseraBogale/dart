void main() {
  int sum = 0;
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers.forEach((element) {
    sum += element;
    print(" vv The sum is increaing by $element and sum is $sum");
  });

}
