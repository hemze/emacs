#include <cstdlib>
#include <iostream>
#include <string>
#include <fstream>

using namespace std;

class transp{


public:
  transp(int rows, int cols){
    int matrix[rows][cols];
    int i,j;
    for(i = 0; i < rows; i++){
      for(j = 0; j < cols; j++){
        cout << "\n[" << i << "]" << "[" << j << "]:";
        cin >> dec >> matrix[i][j];
      }
    }

    cout << "Source matrix:\n";

    for(i = 0; i < rows; i++){
      for(j = 0; j < cols; j++){
        cout << matrix[i][j];
      }
      cout << "\n";
    }

    cout << "Transponed:\n";

    for(i = 0; i < cols; i++){
      for(j = 0; j < rows; j++){
        cout << matrix[j][i];
      }
      cout << "\n";
    }
  }
};

int main(){
  int rows,cols;
  cout << "Strok: "; cin >> dec >> rows;
  cout << "Stolbtsov: "; cin >> dec >> cols;
  transp newTrans(rows,cols);
  return 0;
}
