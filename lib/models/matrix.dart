import 'dart:math';

class Matrix {
  final int row;
  final int col;
  List<List<int>> matrix;

  Matrix({this.row, this.col, this.matrix});

  Matrix generator({row, col}) {
    List<List<int>> matrix = [];
    for (int i = 0; i < row; i++) {
      List<int> temp = [];
      var rand = Random();
      for (int j = 0; j < col; j++) {
        temp.add(rand.nextBool() ? rand.nextInt(20) : -1 * rand.nextInt(20));
      }
      matrix.add(temp);
    }
    return Matrix(col: col, row: row, matrix: matrix);
  }

  Matrix add(Matrix A, Matrix B) {
    List<List<int>> temp = [];
    if (A.row == B.row && A.col == B.col) {
      List<List<int>> a = A.matrix;
      List<List<int>> b = B.matrix;
      for (int i = 0; i < A.row; i++) {
        List<int> temprow = [];
        for (int j = 0; j < A.col; j++) {
          temprow.add(a[i][j] + b[i][j]);
        }
        temp.add(temprow);
      }
    }
    return Matrix(col: A.col, row: A.row, matrix: temp);
  }

  Matrix addMul(List<Matrix> mats) {
    Matrix temp = Matrix().add(mats[0], mats[1]);
    for (int i = 2; i < mats.length; i++) {
      temp = Matrix().add(temp, mats[i]);
    }
    return temp;
  }

  Matrix sub(Matrix A, Matrix B) {
    List<List<int>> temp = [];
    if (A.row == B.row && A.col == B.col) {
      List<List<int>> a = A.matrix;
      List<List<int>> b = B.matrix;
      for (int i = 0; i < A.row; i++) {
        List<int> temprow = [];
        for (int j = 0; j < A.col; j++) {
          temprow.add(a[i][j] - b[i][j]);
        }
        temp.add(temprow);
      }
    }
    return Matrix(row: A.row, col: A.col, matrix: temp);
  }

  Matrix mul(Matrix A, Matrix B) {
    List<List<int>> temp = [];
    if (A.col == B.row) {
      for (int i = 0; i < A.row; i++) {
        List<int> temprow = [];
        for (int j = 0; j < B.col; j++) {
          int sum = 0;
          for (int k = 0; k < B.row; k++) {
            sum = sum + A.matrix[i][k] + B.matrix[k][j];
          }
          temprow.add(sum);
        }
        temp.add(temprow);
      }
    }
    return Matrix(col: B.col, row: A.col, matrix: temp);
  }

  void printMat() => print(matrix);
}
