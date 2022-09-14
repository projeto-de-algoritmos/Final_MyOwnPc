import 'package:my_own_pc/grafo/edge.dart';

class Grafo {
  Map<int, List<Edge>> grafo = {};

  void addVerticeToGraph(int storeId) {
    if (grafo[storeId] == null) {
      grafo[storeId] = [];
    }
  }

  void createEdgeToGraph(int from, int to, int weight) {
    Edge edge = Edge(from: from, to: to, weight: weight);
    grafo[from]?.add(edge);

    Edge returnEdge = Edge(from: to, to: from, weight: weight);
    grafo[to]?.add(returnEdge);
  }

  List<Edge> returnAllEdges() {
    List<Edge> allEdges = [];

    grafo.forEach((key, value) {
      value.forEach((element) {
        allEdges.add(element);
      });
    });

    return allEdges;
  }

  int minDistance(Map<int, int> distance, Map<int, bool> vertexSeted) {
    int min = 100000;
    int minIndex = -1;

    for (int v = 0; v < 11; v++) {
      if (vertexSeted[v] == false && distance[v]! <= min) {
        min = distance[v]!;
        minIndex = v;
      }
    }
    return minIndex;
  }

  int checkIfHasEdge(int from, int to) {
    List<Edge> allEdges = returnAllEdges();

    for (Edge edge in allEdges) {
      if (edge.from == from && edge.to == to) return edge.weight;
    }
    return -1;
  }

  int dijkstra(int source, List<int> missingStores) {
    Map<int, int> distance = {};
    Map<int, bool> vertexSeted = {};

    // Arruma as variaveis de controle para falso e distancia infinita
    for (int i = 0; i < 11; i++) {
      distance[i] = 100000;
      vertexSeted[i] = false;
    }

    distance[source] = 0;

    // Encontra o menor caminho para todos os vértices
    for (int i = 0; i < 10; i++) {
      // Pega o vertice mais proximo dentre os que nao foram visitados
      int minVertex = minDistance(distance, vertexSeted);
      vertexSeted[minVertex] = true;

      // atualiza a distancia em relacao ao vertice que acabou de pegar
      for (int v = 0; v < 11; v++) {
        // atualiza apenas se ja nao foi setado, exista uma edge e o peso seja menor que dist[v]
        int edgeWeight = checkIfHasEdge(minVertex, v);
        if (!vertexSeted[v]! &&
            edgeWeight != -1 &&
            distance[minVertex] != 100000 &&
            distance[minVertex]! + edgeWeight <= distance[v]!) {
          distance[v] = distance[minVertex]! + edgeWeight;
        }
      }
    }
    int minWeight = 10000;
    int nearStore = 0;
    for (var element in missingStores) {
      if (distance[element]! < minWeight) {
        minWeight = distance[element]!;
        nearStore = element;
      }
    }

    return nearStore;
  }

  void buildGraph() {
    for (var i = 0; i < 11; i++) {
      addVerticeToGraph(i);
    }
    createEdgeToGraph(0, 1, 3);
    createEdgeToGraph(0, 8, 3);
    createEdgeToGraph(0, 9, 4);
    createEdgeToGraph(1, 3, 3);
    createEdgeToGraph(1, 10, 2);
    createEdgeToGraph(1, 7, 3);
    createEdgeToGraph(2, 8, 9);
    createEdgeToGraph(2, 4, 2);
    createEdgeToGraph(3, 4, 5);
    createEdgeToGraph(4, 5, 1);
    createEdgeToGraph(4, 9, 6);
    createEdgeToGraph(5, 10, 6);
    createEdgeToGraph(6, 9, 4);
    createEdgeToGraph(8, 10, 7);
  }
}
