import 'package:amaurifinanceiro/database/object_dao.dart';
import 'package:amaurifinanceiro/pages/cadastro/cadastro.dart';

class controle_cadastro {
  DBdao CadastroDao = DBdao();
  Usuario UsuarioObj = Usuario();

  //código generator via sql

  late int _codigousu;
  late String _emailusu;
  late String _senhausu;
  late String _nome;

  setCodigo(int valor) {
    _codigousu = valor;
  }

  setNome(String nome) {
    _nome = nome;
  }

  setEmail(String email) {
    _emailusu = email;
  }

  setSenha(String senha) {
    _senhausu = senha;
  }

  Future<int> getCode() async {
    return _codigousu;
  }

  Future<String> getName() async {
    return _nome;
  }

  SaveCadAmauri() {
    UsuarioObj.codigo = _codigousu;
    UsuarioObj.nome = _nome;
    UsuarioObj.email = _emailusu;
    UsuarioObj.senha = _senhausu;
    CadastroDao.saveContact(UsuarioObj);
    CadastroDao.getAllUsers().then((List) => print(List));
  }

  Future<String?> GetNomeUsuario(int codigo) async {
    return CadastroDao.getUsuarioSecao(21).then((value) => value);
  }
}
