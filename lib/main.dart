import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import 'AboutPage.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:whatsapp_share/whatsapp_share.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Parse().initialize(
    'kG5CRfbAfKiVdoEPJJwFHpPA8wHM7t2AYkBP7f6s',
    'https://parseapi.back4app.com',
    masterKey: 'az5l9ilM8mZfQTsNGbqEPMjZVErYPtmPpHERtblT',
    debug: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task TODO Application',
      theme: ThemeData(
        primarySwatch: Colors.cyan, // Change color theme to teal
        hintColor: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List App'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // share();
              // _shareTaskAsSMS(task.get('title'), task.get('description'));
              _shareAllTasksOnWhatsApp();
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'about') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'about',
                child: Text('About'),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder<List<ParseObject>>(
        future: listTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<ParseObject> tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final ParseObject task = tasks[index];
                return Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    onTap: () {
                      _showTaskDetailsDialog(context, task);
                    },
                    leading: ClipOval(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.cyan,
                        ),
                        child: Center(
                          child: Text(
                            task.get('title').isNotEmpty ? task.get('title')[0].toUpperCase() : '',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      task.get('title'),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(task.get('description')),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _titleController.text = task.get('title');
                            _descriptionController.text = task.get('description');
                            task.get('description');
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Edit Product'),
                                content: Column(
                                  children: [
                                    TextField(
                                      controller: _titleController,
                                      decoration:
                                      InputDecoration(labelText: 'title'),
                                    ),
                                    TextField(
                                      controller: _descriptionController,
                                      decoration: InputDecoration(labelText: 'description'),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await updateTaskDetails(task);
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Text('Save'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            await deleteTask(task);
                            setState(() {});
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {
                            // share();
                            // _shareTaskAsSMS(task.get('title'), task.get('description'));
                            _shareTaskOnWhatsApp(task.get('title'), task.get('description'));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _titleController.clear();
          _descriptionController.clear();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add Product'),
              content: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'title'),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(labelText: 'description'),
                    keyboardType: TextInputType.multiline,
                    minLines: 5,
                    maxLines: 12,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    await createTask();
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }


  // CRUD Operations
  Future<void> createTask() async {
    final ParseObject task = ParseObject('Task')
      ..set('title', _titleController.text)
      ..set('description', _descriptionController.text);
    await task.save();
  }

  Future<List<ParseObject>> listTasks() async {
    final QueryBuilder<ParseObject> queryBuilder =
    QueryBuilder<ParseObject>(ParseObject('Task'))
      ..orderByDescending('createdAt');

    final ParseResponse apiResponse = await queryBuilder.query();
    if (apiResponse.success && apiResponse.results != null) {
      return List<ParseObject>.from(apiResponse.results as Iterable);
    } else {
      return [];
    }
  }

  Future<void> updateTaskDetails(ParseObject task) async {
    task.set('title', _titleController.text);
    task.set('description', _descriptionController.text);
    await task.save();
  }

  Future<void> deleteTask(ParseObject task) async {
    await task.delete();
  }

  void _showTaskDetailsDialog(BuildContext context, ParseObject task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Task Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Task Name: ${task.get('title')}'),
              Text('Task Description: ${task.get('description')}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }


  void _shareTaskOnWhatsApp(String taskName, String taskDescription) {
    String url = "https://wa.me/?text=TaskDetails\nTitle: $taskName\nTask Description: $taskDescription";
    launchUrl(Uri.parse(url));
  }

  void _shareAllTasksOnWhatsApp() async{
    final QueryBuilder<ParseObject> queryBuilder =
    QueryBuilder<ParseObject>(ParseObject('Task'))
      ..orderByDescending('createdAt');

    final ParseResponse apiResponse = await queryBuilder.query();
    List<ParseObject> task = List<ParseObject>.from(apiResponse.results as Iterable);

    String url = "https://wa.me/?text=TaskDetails\n";
    for(ParseObject p in task)
      {
        String taskDetails = "\nTitle: "+p.get("title")+"\nTask Description: "+p.get("description")+"\n\n";
        url = url + taskDetails;
      }
    launchUrl(Uri.parse(url));
  }

}