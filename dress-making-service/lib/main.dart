import 'package:flutter/material.dart';

void main() => runApp(DressifyApp());

class DressifyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dressify - Dressmaking Service',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Icon(Icons.design_services, color: Colors.pink, size: 100),
                SizedBox(height: 16),
                Text(
                  "Dressify",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                Text("Your personal dressmaking companion",
                    style: TextStyle(color: Colors.grey[600])),
                SizedBox(height: 32),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailCtrl,
                        decoration: InputDecoration(labelText: "Email"),
                        validator: (v) {
                          if (v == null || v.isEmpty) return "Enter email";
                          if (!v.contains('@')) return "Invalid email format";
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordCtrl,
                        obscureText: true,
                        decoration: InputDecoration(labelText: "Password"),
                        validator: (v) =>
                            v == null || v.isEmpty ? "Enter password" : null,
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text("Login", style: TextStyle(fontSize: 18)),
                      ),
                      SizedBox(height: 12),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => RegisterPage()),
                          );
                        },
                        child: Text("Create an account"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  String? _role;

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Account created successfully!")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: InputDecoration(labelText: "Full Name"),
                validator: (v) =>
                    v == null || v.isEmpty ? "Enter your name" : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _emailCtrl,
                decoration: InputDecoration(labelText: "Email"),
                validator: (v) {
                  if (v == null || v.isEmpty) return "Enter email";
                  if (!v.contains('@')) return "Invalid email";
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _passCtrl,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                validator: (v) =>
                    v == null || v.isEmpty ? "Enter password" : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _confirmCtrl,
                obscureText: true,
                decoration: InputDecoration(labelText: "Confirm Password"),
                validator: (v) {
                  if (v != _passCtrl.text) return "Passwords don’t match";
                  return null;
                },
              ),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: "Role"),
                value: _role,
                items: ['Customer', 'Tailor', 'Admin']
                    .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                    .toList(),
                onChanged: (v) => setState(() => _role = v),
                validator: (v) => v == null ? "Select role" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                ),
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selected = 0;
  final _pages = [ServiceFormPage(), OrdersPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dressify Services")),
      body: _pages[_selected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected,
        onTap: (i) => setState(() => _selected = i),
        selectedItemColor: Colors.pink,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.design_services), label: "Request"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Orders"),
        ],
      ),
    );
  }
}

class ServiceFormPage extends StatefulWidget {
  @override
  _ServiceFormPageState createState() => _ServiceFormPageState();
}

class _ServiceFormPageState extends State<ServiceFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _designCtrl = TextEditingController();

  bool _urgent = false;
  bool _notify = false;
  String? _role;
  DateTime? _date;
  TimeOfDay? _time;

  List<Order> orders = [];

  void _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
    );
    if (picked != null) setState(() => _date = picked);
  }

  void _pickTime() async {
    final picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) setState(() => _time = picked);
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final order = Order(
        name: _nameCtrl.text,
        email: _emailCtrl.text,
        design: _designCtrl.text,
        date: _date,
        time: _time,
        urgent: _urgent,
      );
      setState(() => orders.add(order));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Order submitted!")));
      _formKey.currentState!.reset();
      _urgent = false;
      _notify = false;
      _role = null;
      _date = null;
      _time = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Text("Request a Dress Service",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink)),
            SizedBox(height: 16),
            TextFormField(
              controller: _nameCtrl,
              decoration: InputDecoration(labelText: "Full Name"),
              validator: (v) => v!.isEmpty ? "Enter name" : null,
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _emailCtrl,
              decoration: InputDecoration(labelText: "Email"),
              validator: (v) => v!.contains("@") ? null : "Enter valid email",
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _designCtrl,
              decoration: InputDecoration(labelText: "Dress Design Details"),
              maxLines: 2,
            ),
            SizedBox(height: 12),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Role"),
              value: _role,
              items: ['Customer', 'Tailor', 'Admin']
                  .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                  .toList(),
              onChanged: (v) => setState(() => _role = v),
              validator: (v) => v == null ? "Select role" : null,
            ),
            SizedBox(height: 12),
            CheckboxListTile(
              title: Text("Urgent Order"),
              value: _urgent,
              onChanged: (v) => setState(() => _urgent = v!),
            ),
            SwitchListTile(
              title: Text("Notify me when ready"),
              value: _notify,
              onChanged: (v) => setState(() => _notify = v),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _pickDate,
                  child: Text("Pick Date"),
                ),
                SizedBox(width: 12),
                Text(_date == null
                    ? "No date selected"
                    : "${_date!.month}/${_date!.day}/${_date!.year}"),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _pickTime,
                  child: Text("Pick Time"),
                ),
                SizedBox(width: 12),
                Text(_time == null ? "No time" : _time!.format(context)),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 14)),
              child: Text("Submit Request"),
            ),
          ],
        ),
      ),
    );
  }
}

class OrdersPage extends StatelessWidget {
  final List<Order> dummyOrders = [
    Order(
      name: "Maria Santos",
      email: "maria@example.com",
      design: "Long gown, silk fabric, color: maroon",
      urgent: true,
      date: DateTime.now(),
      time: TimeOfDay(hour: 14, minute: 30),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyOrders.length,
      itemBuilder: (context, i) {
        final o = dummyOrders[i];
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: Icon(Icons.person, color: Colors.pink),
            title: Text(o.name),
            subtitle: Text(
                "${o.design}\n${o.email}\nUrgent: ${o.urgent}\nAppointment: ${o.date?.month}/${o.date?.day} ${o.time?.format(context)}"),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}

class Order {
  final String name;
  final String email;
  final String design;
  final DateTime? date;
  final TimeOfDay? time;
  final bool urgent;

  Order({
    required this.name,
    required this.email,
    required this.design,
    this.date,
    this.time,
    required this.urgent,
  });
}
