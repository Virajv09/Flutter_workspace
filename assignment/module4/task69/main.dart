import 'package:flutter/material.dart';

void main() {
  runApp(GmailCloneApp());
}

class GmailCloneApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: GmailClone(),
    );
  }
}

class GmailClone extends StatefulWidget
{
  @override
  _GmailCloneState createState() => _GmailCloneState();
}

class _GmailCloneState extends State<GmailClone>
{
  List<Email> emails = []; // List to hold email data

  @override
  void initState()
  {
    super.initState();
    // Simulate fetching email data from an API or database
    fetchEmails();
  }

  void fetchEmails()
  {
    // Simulated email data, replace this with actual data retrieval code
    List<Email> fetchedEmails = [
      Email(" Dharmik", "invitation to github collaboration i've created the collab repo,...", "1h ago"),
      Email("Zometo", "our delivery partners pich up your orders...", "2h ago"),
      Email("paytm", "Rs.1000 added successfully...", "oct 30"),
      Email("Amazon.in", "your amazon.in order...", "oct 29"),
      Email("Google Pay", "Rs.500 added successfully...", "oct 25"),
      Email(" jay", "invitation to github collaboration i've created the collab repo,...", "oct 25"),
      Email("Zometo", "our delivery partners pich up your orders...", "oct24"),
      Email("paytm", "Rs.1000 added successfully...", "oct 22"),
      Email("flipkart", "your amazon.in order...", "oct 20"),
      Email("Google Pay", "Rs.500 added successfully...", "oct 15"),




      // Add more email data here
    ];

    setState(()
    {
      emails = fetchedEmails;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gmail Clone'),
      ),
      body: EmailList(emails),
        floatingActionButton: FloatingActionButton
          (
          child: Icon(Icons.email_rounded),
          backgroundColor: Colors.blue,

          onPressed: ()
          {
           // Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => page1()));
          },

        )
    );
  }
}

class EmailList extends StatelessWidget
{
  final List<Email> emails;

  EmailList(this.emails);

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(
      itemCount: emails.length,
      itemBuilder: (context, index)
      {
        Email email = emails[index];
        return ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person)
            // Text(email.sender[index]), // Use the first letter of sender's name as an avatar
          ),
          title:    Text('${email.sender}'),
          subtitle: Text(email.subject),

          trailing: Text('${email.timestamp}'),

        );

      },
    );
  }


}



class Email
{
  final String sender;
  final String subject;
  final String timestamp;

  Email(this.sender, this.subject, this.timestamp);
}

