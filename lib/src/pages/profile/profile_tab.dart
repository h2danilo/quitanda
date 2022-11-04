import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil Usuário"),
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //Email
          CustomTextField(
              initialValue: appData.user.email,
              isReadOnly: true,
              icon: Icons.email,
              label: "Email"),

          //Nome
          CustomTextField(
              initialValue: appData.user.name,
              isReadOnly: true,
              icon: Icons.person,
              label: "Nome"),

          //Celular
          CustomTextField(
              initialValue: appData.user.phone,
              isReadOnly: true,
              icon: Icons.phone,
              label: "Celular"),

          // CPF
          CustomTextField(
            initialValue: appData.user.cpf,
            isReadOnly: true,
            icon: Icons.file_copy,
            label: "CPF",
            isSecret: true,
          ),

          // Botão para atualizar a senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: const BorderSide(
                  color: Colors.green,
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text("Atualizar Senha"),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Titulo
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Atualização de senha",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),

                    //Senha Atual
                    const CustomTextField(
                      icon: Icons.lock,
                      label: "Senha Atual",
                      isSecret: true,
                    ),

                    //Nova Senha
                    const CustomTextField(
                      icon: Icons.lock_outline,
                      label: "Nova Senha",
                      isSecret: true,
                    ),

                    //Confirmar nova senha
                    const CustomTextField(
                      icon: Icons.lock_outline,
                      label: "Confirmar nova Senha",
                      isSecret: true,
                    ),

                    //Botão de confirmação
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: (() {}),
                        child: const Text(
                          "Atualizar",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
