import 'package:flutter/material.dart';

class TaskTitle {
  final String name;
  const TaskTitle(this.name);
}

typedef void CartChangedCallback(TaskTitle product, bool inCart);

class ShopListItem extends StatelessWidget {
  final TaskTitle product;
  final bool isAddChart;
  final CartChangedCallback onCartChanged;
  const ShopListItem(
      {Key key, this.product, this.isAddChart, this.onCartChanged})
      : super(key: key);
  _getColor(context) =>
      isAddChart ? Colors.black12 : Theme.of(context).primaryColor;
  _getTextStyle(BuildContext context) {
    if (!isAddChart) return null;
    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  build(context) => ListTile(
      onTap: () => onCartChanged(product, !isAddChart),
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)));
}

class ShoppingList extends StatefulWidget {
  final List<TaskTitle> products;
  ShoppingList({this.products});

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<TaskTitle> _shoppingCart = Set<TaskTitle>();
  void _handleCartChanged(TaskTitle product, bool isAddChart) => setState(() {
        isAddChart ? _shoppingCart.add(product) : _shoppingCart.remove(product);
      });
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('任务清单')),
      body: ListView(
          children: widget.products
              .map((TaskTitle product) => ShopListItem(
                    product: product,
                    isAddChart: _shoppingCart.contains(product),
                    onCartChanged: _handleCartChanged,
                  ))
              .toList()));
}

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ShoppingList(products: <TaskTitle>[
      TaskTitle("Macbook Pro 2019"),
      TaskTitle("A"),
      TaskTitle("一只程序媛")
    ])));
