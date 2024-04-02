#include <Tpetra_CrsGraph.hpp>
#include <MueLu_TpetraOperator.hpp>
#include <MueLu_HierarchyManager.hpp>
int main(){
  using Scalar = double;
#if 0
  using LocalOrdinal = Tpetra::Map<>::local_ordinal_type;
  using GlobalOrdinal = Tpetra::Map<>::global_ordinal_type;
#else
  using LocalOrdinal = int;
  using GlobalOrdinal = int;
#endif
  using Graph = Tpetra::CrsGraph<LocalOrdinal, GlobalOrdinal>;
  using Node = Graph::node_type;
  MueLu::HierarchyManager<Scalar, LocalOrdinal, GlobalOrdinal, Node> noopManager;
}
