part of 'extensions.dart';

extension ListExtension<T> on List<T> {
  List<String> toEachString() => map<String>((e) => e.toString()).toList();

  int get lastIndex => length - 1;

  T? get lastOrNull => isEmpty ? null : last;

  T? get firstOrNull => isEmpty ? null : first;

  List<T> get copy => List.from(this);

  List<T>? get nullIfEmpty => isEmpty ? null : this;

  T? tryRemoveLast() {
    try {
      return removeLast();
    } catch (e) {
      return null;
    }
  }

  T? firstWhereOrNull(bool Function(T element) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }

  T? lastWhereOrNull(bool Function(T element) test) {
    try {
      return lastWhere(test);
    } catch (e) {
      return null;
    }
  }

  bool everyAfter(
    int index,
    bool Function(T element) test,
  ) {
    final List<T> nextList = sublist(index + 1);
    return nextList.every(test);
  }

  bool isEqualTo(List<T> list) {
    if (length != list.length) return false;
    for (int i = 0; i < length; i++) {
      if (this[i] != list[i]) return false;
    }
    return true;
  }

  bool isEqualBy(
    List<T> list,
    bool Function(T element, T other) equalityChecker,
  ) {
    if (length != list.length) return false;
    for (int i = 0; i < length; i++) {
      if (!equalityChecker(this[i], list[i])) return false;
    }
    return true;
  }

  void replaceWhere(Iterable<T> replacement, bool Function(T element) test) {
    int index = indexWhere(test);

    if (index == -1) throw StateError('index not found in $this');
    replaceRange(index, index + 1, replacement);
  }

  List<E> mapWithIndex<E>(E Function(int index, T element) test) {
    final List<E> nextList = [];
    for (int i = 0; i < length; i++) {
      nextList.add(test(i, this[i]));
    }
    return nextList;
  }

  void clearDuplicates() {
    final List<T> nextList = [];
    for (int i = 0; i < length; i++) {
      if (!nextList.contains(this[i])) {
        nextList.add(this[i]);
      }
    }
    clear();
    addAll(nextList);
  }

  void clearDuplicatesWhere(bool Function(T element1, T element2) test) {
    final List<T> nextList = [];
    for (int i = 0; i < length; i++) {
      if (!nextList.containsWhere((element) => test(element, this[i]))) {
        nextList.add(this[i]);
      }
    }
    clear();
    addAll(nextList);
  }

  int? indexWhereOrNull(bool Function(T element) test) {
    try {
      final int index = indexWhere(test);
      return index == -1 ? null : index;
    } catch (e) {
      return null;
    }
  }

  List<List<T>> splitEvery(int n) {
    final List<List<T>> nextList = [];
    for (int i = 0; i < length; i += n) {
      nextList.add(sublist(i, i + n));
    }
    return nextList;
  }

  List<List<T>> split(T element) {
    final List<List<T>> nextList = [];
    int index = 0;
    for (int i = 0; i < length; i++) {
      if (this[i] == element) {
        nextList.add(sublist(index, i));
        index = i + 1;
      }
    }
    nextList.add(sublist(index));
    return nextList;
  }

  // bool containsSequence(List<T> value) {
  //   // copy exist to control the loop condition
  //   final List<T> temp = copy;
  //
  //   // every list should contain an empty list by default
  //   if (value.isEmpty) return true;
  //
  //   while (temp.contains(value.first)) {
  //     final int indexOfFirst = indexOf(value.first);
  //
  //     if (indexOfFirst == -1) return false;
  //
  //     bool isMatch = true;
  //
  //     for (int i = indexOfFirst; i < (indexOfFirst + value.length); i++) {
  //       isMatch = this[i] == value[i - indexOfFirst];
  //     }
  //
  //     if (isMatch) return true;
  //
  //     temp.removeAt(indexOfFirst);
  //   }
  //   return false;
  // }

  // int firstIndexOfSequence(List<T> value) {
  //   List<T> temp = copy;
  //
  //   int readLength = 0;
  //
  //   if (value.isEmpty) return -1;
  //   while (temp.contains(value.first)) {
  //     final List<T> temp = copy;
  //
  //     int indexOfFirst = temp.indexOf(value.first);
  //
  //     if (indexOfFirst == -1) return -1;
  //
  //     indexOfFirst += readLength;
  //
  //     bool isMatch = true;
  //
  //     for (int i = indexOfFirst; i < (indexOfFirst + value.length); i++) {
  //       isMatch = [i] == value[i - indexOfFirst];
  //     }
  //
  //     print('is match: $isMatch | ${this[15]}');
  //
  //     if (isMatch) return indexOfFirst;
  //
  //     readLength = indexOfFirst;
  //     temp.removeRange(0, indexOfFirst);
  //   }
  //   return -1;
  // }

  // bool removeEverySequenceFrom(List<T> sequence) {
  //   final List<T> temp = copy;
  //
  //   if (sequence.isEmpty) return false;
  //   while (temp.contains(sequence.first)) {
  //     final int indexOfFirst = indexOf(sequence.first);
  //
  //     if (indexOfFirst == -1) return false;
  //
  //     bool isMatch = true;
  //
  //     for (int i = indexOfFirst; i < (indexOfFirst + sequence.length); i++) {
  //       isMatch = this[i] == sequence[i - indexOfFirst];
  //     }
  //
  //     if (isMatch) {
  //       removeRange(indexOfFirst, indexOfFirst + sequence.length);
  //       temp.removeRange(indexOfFirst, indexOfFirst + sequence.length);
  //     } else {
  //       temp.removeAt(indexOfFirst);
  //     }
  //   }
  //   return true;
  // }

  /// Assuming elements is a small list, this is O(log n)
  ///
  /// If elements is a large list, this is O(n log n)
  // List<List<T>> splitBy(List<T> sublist) {
  //   final List<T> remainingItems = copy;
  //   final List<List<T>> nextList = [];
  //
  //   while (remainingItems.isNotEmpty) {
  //     final int indexOfFirst = remainingItems.indexOf(sublist.first);
  //     if (indexOfFirst == -1) {
  //       nextList.add(remainingItems);
  //       break;
  //     }
  //
  //     bool isMatch = sublist.first == remainingItems[indexOfFirst];
  //
  //     for (int i = (indexOfFirst); i < (indexOfFirst + sublist.length); i++) {
  //       final int sublistIndex = i - indexOfFirst;
  //       isMatch = sublist[sublistIndex] == remainingItems[i];
  //       if (!isMatch) break;
  //     }
  //
  //     if (isMatch) {
  //       if (indexOfFirst == 0) {
  //         remainingItems.removeRange(0, sublist.length);
  //         continue;
  //       }
  //
  //       nextList.add(remainingItems.sublist(0, indexOfFirst));
  //
  //       remainingItems.removeRange(0, indexOfFirst + sublist.length);
  //     } else {
  //       final int nextFirstIndex = (remainingItems.copy..removeAt(indexOfFirst))
  //           .indexOf(sublist.first);
  //
  //       nextList.add(
  //         remainingItems.sublist(
  //           0,
  //           (nextFirstIndex == -1 ? null : (nextFirstIndex + 1)),
  //         ),
  //       );
  //
  //       remainingItems.removeRange(
  //         0,
  //         (nextFirstIndex == -1 ? remainingItems.length : (nextFirstIndex + 1)),
  //       );
  //     }
  //   }
  //   return nextList;
  // }

  /// Assuming elements is a small list, this is O(n^2)
  ///
  /// If elements is a large list, this is O(n log n)
  // int firstIndexOf(List<T> elements) {
  //   final List<T> remainingItems = copy;
  //
  //   // this is O(log n)
  //   final int indexOfFirst = remainingItems.indexOf(elements.first);
  //   if (indexOfFirst == -1) return -1;
  //
  //   bool isMatch = true;
  //
  //   // for small lists this is O(1)
  //   for (int i = (indexOfFirst + 1); i < elements.length; i++) {
  //     final int sublistIndex = i - indexOfFirst;
  //     isMatch = elements[sublistIndex] == remainingItems[i];
  //     if (!isMatch) break;
  //   }
  //
  //   if (isMatch) {
  //     return indexOfFirst;
  //   } else {
  //     return -1;
  //   }
  // }

  bool everyBetween(int start, int end, bool Function(T element) test) {
    final List<T> nextList = sublist(start, end);
    return nextList.every(test);
  }

  bool anyAfter(
    int index,
    bool Function(T element) test,
  ) {
    final List<T> nextList = sublist(index + 1);
    return nextList.any(test);
  }

  bool anyBetween(int start, int end, bool Function(T element) test) {
    final List<T> nextList = sublist(start, end);
    return nextList.any(test);
  }

  bool anyBefore(
    int index,
    bool Function(T element) test,
  ) {
    final List<T> nextList = sublist(0, index);
    return nextList.any(test);
  }

  void forEachWhere(
    bool Function(T element) test,
    void Function(T element) action,
  ) {
    for (T element in this) {
      if (test(element)) {
        action(element);
      }
    }
  }

  void forEachWhereAfter({
    required int index,
    required bool Function(T element) where,
    required void Function(T element) action,
  }) {
    final List<T> nextList = sublist(index + 1);
    nextList.forEachWhere(where, action);
  }

  void forEachWhereBefore({
    required int index,
    required bool Function(T element) where,
    required void Function(T element) action,
  }) {
    final List<T> nextList = sublist(0, index);
    nextList.forEachWhere(where, action);
  }

  void forEachWhereBeforeWithIndex({
    required int index,
    required bool Function(T element) where,
    required void Function(int index) action,
  }) {
    final List<T> nextList = sublist(0, index);

    for (int i = 0; i < nextList.length; i++) {
      if (where(nextList[i])) {
        action(i);
      }
    }
  }

  void forEachAfter(
    int index,
    void Function(T element) action,
  ) {
    final List<T> nextList = sublist(index + 1);
    nextList.forEach(action);
  }

  List<T> operator *(int times) {
    if (isEmpty) return [];

    final List<T> nextList = [];
    for (int i = 0; i < times; i++) {
      nextList.addAll(this);
    }

    return nextList;
  }

  bool containsAll(Iterable<T> it) {
    for (T item in it) {
      if (!contains(item)) return false;
    }
    return true;
  }

  void addWhere(T element, bool Function(T element) test) {
    for (final T item in this) {
      if (test(item)) {
        add(element);
        return;
      }
    }
  }

  void addWhereAbsent(Iterable<T> it) {
    for (T item in it) {
      if (!contains(item)) {
        add(item);
      }
    }
  }

  bool isFirst(T element, [bool Function(T? element)? test]) {
    if (isEmpty) return false;
    return test?.call(first) ?? first == element;
  }

  T? elementAtOrNull(int index) {
    try {
      return this[index];
    } catch (e) {
      return null;
    }
  }

  bool hasElementAfter(T element) {
    if (!contains(element)) throw StateError('test element is not in list');

    if (isLast(element)) return false;

    return true;
  }

  bool isLast(T element, [bool Function(T? element)? test]) {
    if (isEmpty) return false;
    return test?.call(last) ?? last == element;
  }

  bool containsWhere(bool Function(T element) test) {
    for (T element in this) {
      bool satisfied = test(element);
      if (satisfied) {
        return true;
      }
    }
    return false;
  }

  void pushFront(T element) {
    return insert(0, element);
  }

  List<T> operator +(List<T> other) {
    final List<T> tempList = [];
    tempList.addAll(this);
    tempList.addAll(other);
    return tempList;
  }

  bool isEachEqual(List<T> other) {
    if (length != other.length) return false;
    if (isEmpty && other.isEmpty) return true;
    if (isEmpty ^ other.isEmpty) return false;
    bool isEqual = false;
    for (int i = 0; i < length; i++) {
      isEqual = [i] == other[i];
    }
    return isEqual;
  }

  void replaceLast(Iterable<T> replacement) {
    if (length == 0) throw StateError('List is empty');
    replaceRange(length - 1, length, replacement);
  }

  void addIfAbsent(T element) {
    if (contains(element)) return;
    add(element);
  }

  void replaceFirst(Iterable<T> replacement) {
    if (length == 0) throw StateError('List is empty');
    replaceRange(0, 1, replacement);
  }
}

extension EfficientList<T> on List<T> {
  List<List<T>> splitBy(Iterable<T> separator) {
    List<List<T>> result = [];
    List<T> current = [];
    int i = 0;
    while (i < length) {
      bool isMatch = true;
      for (int j = 0; j < separator.length; j++) {
        if (i + j >= length || this[i + j] != separator.elementAt(j)) {
          isMatch = false;
          break;
        }
      }
      if (isMatch) {
        result.add(current);
        current = [];
        i += separator.length;
      } else {
        current.add(this[i]);
        i++;
      }
    }
    if (current.isNotEmpty) result.add(current);
    return result;
  }

  void removeEverySequence(Iterable<T> sequence) {
    List<T> result = [];
    int i = 0;
    while (i < length) {
      bool isMatch = true;
      for (int j = 0; j < sequence.length; j++) {
        if (i + j >= length || this[i + j] != sequence.elementAt(j)) {
          isMatch = false;
          break;
        }
      }
      if (isMatch) {
        i += sequence.length;
      } else {
        result.add(this[i]);
        i++;
      }
    }
    clear();
    addAll(result);
  }

  List<int> _computeTemporaryArray(Iterable<T> sequence) {
    List<int> lps = List.filled(sequence.length, 0);
    int index = 0;
    for (int i = 1; i < sequence.length;) {
      if (sequence.elementAt(i) == sequence.elementAt(index)) {
        lps[i] = index + 1;
        index++;
        i++;
      } else {
        if (index != 0) {
          index = lps[index - 1];
        } else {
          lps[i] = 0;
          i++;
        }
      }
    }
    return lps;
  }

  int firstIndexOf(Iterable<T> sequence) {
    if (sequence.isEmpty) return -1;

    List<int> lps = _computeTemporaryArray(sequence);
    int i = 0;
    int j = 0;
    while (i < length && j < sequence.length) {
      if (this[i] == sequence.elementAt(j)) {
        i++;
        j++;
      }
      if (j == sequence.length) {
        return i - j;
      } else if (i < length && this[i] != sequence.elementAt(j)) {
        if (j != 0) {
          j = lps[j - 1];
        } else {
          i++;
        }
      }
    }
    return -1;
  }

  bool containsSequence(Iterable<T> sequence) {
    return this.firstIndexOf(sequence) != -1;
  }
}
