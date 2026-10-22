class ItemPedido {
  final String nome;
  final double preco;
  final int quantidade;

  ItemPedido({
    required this.nome,
    required this.preco,
    required this.quantidade,
  });

  void exibirLinha() {
    double subtotal = preco * quantidade;
    print('$quantidade x $nome (R\$ ${preco.toStringAsFixed(2)}) = R\$ ${subtotal.toStringAsFixed(2)}');
  }
}

class Pedido {
  final String cliente;
  List<ItemPedido> itens = [];

  Pedido(this.cliente);

  void adicionarItem(ItemPedido item) {
    itens.add(item);
  }

  void mostrarResumo() {
    double subtotal = 0.0;

    print('Pedido de $cliente');

    for (ItemPedido item in itens) {
      item.exibirLinha();
      subtotal += item.preco * item.quantidade;
    }

    double desconto;
    if (subtotal > 200) {
      desconto = subtotal * 0.10;
    } else {
      desconto = 0.0;
    }

    double total = subtotal - desconto;

    print('Subtotal: R\$ ${subtotal.toStringAsFixed(2)}');
    if (desconto > 0) {
      print('Desconto (10%): R\$ ${desconto.toStringAsFixed(2)}');
    } else {
      print('Desconto (0%): R\$ ${desconto.toStringAsFixed(2)}');
    }
    print('Total a pagar: R\$ ${total.toStringAsFixed(2)}');
  }
}

void main() {
  Pedido pedido = Pedido('Carla');

  pedido.adicionarItem(
    ItemPedido(nome: 'Teclado', preco: 150.00, quantidade: 1),
  );
  pedido.adicionarItem(
    ItemPedido(nome: 'Mouse', preco: 89.90, quantidade: 2),
  );
  pedido.adicionarItem(
    ItemPedido(nome: 'Mousepad', preco: 35.50, quantidade: 1),
  );

  pedido.mostrarResumo();
}
