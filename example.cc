#include <Tpetra_CrsGraph.hpp>
#include <MueLu_TpetraOperator.hpp>
#include <MueLu_HierarchyManager.hpp>
int main(){
  using Scalar = double;
  using LocalOrdinal = int;
  using GlobalOrdinal = int;
  using Graph = Tpetra::CrsGraph<LocalOrdinal, GlobalOrdinal>;
  using Node = Graph::node_type;
  MueLu::HierarchyManager<Scalar, LocalOrdinal, GlobalOrdinal, Node> noopManager;
}
