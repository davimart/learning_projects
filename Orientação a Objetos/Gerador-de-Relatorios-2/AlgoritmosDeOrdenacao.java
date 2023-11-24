import java.util.ArrayList;
import java.util.Comparator;

//Arquivo que contém os algoritmos de ordenação suportados pelo programa

public interface AlgoritmosDeOrdenacao<T> {
  void ordenar(ArrayList<T> lista, Comparator<? super T> comparador);
}

class QuickSort<T> implements AlgoritmosDeOrdenacao<T> {

  @Override
  public void ordenar(ArrayList<T> lista, Comparator<? super T> comparador) {
      if (lista == null || lista.isEmpty()) {
          return;
      }
      quicksort(lista, 0, lista.size() - 1, comparador);
  }

  private void quicksort(ArrayList<T> lista, int baixo, int alto, Comparator<? super T> comparador) {
    if (baixo < alto) {
      int indicePivo = particionar(lista, baixo, alto, comparador);

      quicksort(lista, baixo, indicePivo - 1, comparador);
      quicksort(lista, indicePivo + 1, alto, comparador);
      }
  }

  private int particionar(ArrayList<T> lista, int baixo, int alto, Comparator<? super T> comparador) {
      T pivo = lista.get(alto);
      int i = baixo - 1;

      for (int j = baixo; j < alto; j++) {
          if (comparador.compare(lista.get(j), pivo) <= 0) {
              i++;
              trocar(lista, i, j);
          }
      }

      trocar(lista, i + 1, alto);
      return i + 1;
  }

  private void trocar(ArrayList<T> lista, int i, int j) {
      T temp = lista.get(i);
      lista.set(i, lista.get(j));
      lista.set(j, temp);
  }
}


class InsertionSort<T> implements AlgoritmosDeOrdenacao<T> {
  
  @Override
  public void ordenar(ArrayList<T> lista, Comparator<? super T> comparador) {
      if (lista == null || lista.size() <= 1) {
          return;
      }
      for (int i = 1; i < lista.size(); i++) {
          T chave = lista.get(i);
          int j = i - 1;

          while (j >= 0 && comparador.compare(lista.get(j), chave) > 0) {
              lista.set(j + 1, lista.get(j));
              j--;
          }

          lista.set(j + 1, chave);
      }
  }
}
