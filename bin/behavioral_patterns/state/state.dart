void main(List<String> args) {
  Problem problem = FindProblem();
  Engineer engineer = Engineer();

  engineer.setProblem(problem);

  for(int i=0;i<12;i++){
    engineer.doing();
    engineer.nextSolve();
  }
}

//- State
abstract class Problem{
  void solve(); 
}

class FindProblem implements Problem{
  @override
  void solve() {
    print("Знайшли проблему!");
  }
}

class SetProblem implements Problem{
  @override
  void solve() {
    print("Встановили, що це за проблема!");
  }
}

class SolveProblem implements Problem{
  @override
  void solve() {
    print("Вирішили проблему!");
    print("="*30);
  }
}

//- Context
class Engineer{
  Problem? problem;

  void setProblem(Problem p){
    problem = p;
  }

  void nextSolve(){
    if(problem is FindProblem){
      setProblem(SetProblem());
    }
    else if(problem is SetProblem){
      setProblem(SolveProblem());
    }
    else if(problem is SolveProblem){
      setProblem(FindProblem());
    }
  }

  void doing(){
    problem!.solve();
  }
}