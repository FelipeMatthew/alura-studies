import 'package:hyrule/data/dao/database.dart';
import 'package:hyrule/data/dao/entry_dao.dart';
import 'package:hyrule/domain/business/dao_workflow.dart';

class DaoController implements DaoWorkflow {
  Future<EntryDao> createDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
    final EntryDao entryDao = database.entryDao;
    return entryDao;
  }
} 