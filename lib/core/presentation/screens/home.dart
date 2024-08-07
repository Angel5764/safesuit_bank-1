import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/services/api_services.dart';
import 'package:safesuit_bank/core/presentation/screens/TransSelecionUser.dart';
import 'package:safesuit_bank/core/presentation/screens/bankCard.dart';
import 'package:safesuit_bank/core/presentation/screens/movimientos.dart';
import 'package:safesuit_bank/core/presentation/screens/serviceAgua.dart';
import 'package:safesuit_bank/core/presentation/screens/serviceCFE.dart';
import 'package:safesuit_bank/core/presentation/screens/serviceTelcel.dart';
import 'package:safesuit_bank/core/presentation/screens/vistaPerfil.dart';
import 'package:safesuit_bank/core/presentation/screens/paymentqr.dart';
import 'package:safesuit_bank/core/presentation/screens/login.dart';
import 'package:safesuit_bank/core/presentation/bloc/homes/user_home_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/homes/user_home_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/homes/user_home_state.dart';
import 'package:safesuit_bank/core/domain/usecases/get_user_home_profile.dart';
import 'package:safesuit_bank/data/repositories/user_home_repository_imp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeBloc(
        getUserHomeProfile: GetUserHomeProfile(
          repository: UserHomeRepositoryImpl(apiService: ApiService()),
        ),
      )..add(FetchUserHomeProfile()), // Inicializa la obtención del perfil del usuario
      child: const HomeViewContent(),
    );
  }
}

class HomeViewContent extends StatefulWidget {
  const HomeViewContent({super.key});

  @override
  _HomeViewContentState createState() => _HomeViewContentState();
}

class _HomeViewContentState extends State<HomeViewContent> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _checkTokenAndFetchProfile();
  }

  Future<void> _checkTokenAndFetchProfile() async {
    final token = await _getAuthToken();
    if (token != null && token.isNotEmpty) {
      context.read<UserHomeBloc>().add(FetchUserHomeProfile());
    } else {
      print("Token no disponible en la vista Home");
    }
  }

  Future<String?> _getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    print("Token fetched in Home: $token");  // Línea de depuración
    return token;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PerfilScreen()),
      );
    }
  }

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token'); // Eliminar el token guardado

    // Reiniciar el estado del BLoC si es necesario
    context.read<UserHomeBloc>().add(TokenNotFoundEvent());

    // Navegar a la pantalla de login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inicio")),
      drawer: BlocBuilder<UserHomeBloc, UserHomeState>(
        builder: (context, state) {
          return NavigationDrawer(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(state.userName),
                accountEmail: Text(state.userEmail),
                currentAccountPicture: const CircleAvatar(
                  child: ClipOval(child: Icon(Icons.person)),
                ),
                decoration: const BoxDecoration(color: Color.fromARGB(255, 23, 36, 105)),
              ),
              const ListTile(
                leading: Icon(Icons.help),
                title: Text('Ayuda'),
              ),
              const ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notificaciones'),
              ),
              ListTile(
                  leading: const Icon(Icons.arrow_forward),
                  title: const Text('Transferir dinero'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const TransUser()));
                  }),
              ListTile(
                  leading: const Icon(Icons.arrow_back),
                  title: const Text('Movimientos'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TransactionView()));
                  }),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Cerrar Sesión'),
                onTap: () => _logout(context), // Llama al método _logout
              ),
            ],
          );
        },
      ),
      body: BlocBuilder<UserHomeBloc, UserHomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error.isNotEmpty) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenido ${state.userName}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  BankCard(),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Acción para Movimientos
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 66, 79, 120),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 21),
                        ),
                        child: const Column(
                          children: [
                            Text(
                              'Movimientos',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text('Paypal -\$90.00',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ))
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Saldo:\n\$500.00',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40), // Espacio
                  //Empiezan las opciones
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 9, 24, 109),
                          Color.fromARGB(168, 0, 0, 0)
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        const Text(
                          'Opciones',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  // Acción para Token app
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.security, size: 40),
                                      Text(
                                        '¡Token APP',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RetirarQR()));
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.widgets, size: 40),
                                      Text(
                                        'Retiros QR',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  // Acción para Virtual Card
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.credit_card, size: 40),
                                      Text(
                                        'Card Digital',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  // Acción para More
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.menu, size: 40),
                                      Text(
                                        'Más',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Servicios',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TransAgua(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[200],
                                    ),
                                    child: const Icon(
                                      Icons.water,
                                      size: 40,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Agua',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TransCFE(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[200],
                                    ),
                                    child: const Icon(
                                      Icons.flash_on,
                                      size: 40,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'CFE',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TransTelcel(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[200],
                                    ),
                                    child: const Icon(
                                      Icons.phone_android,
                                      size: 40,
                                      color: Colors.green,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Telcel',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              )),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Ayuda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
