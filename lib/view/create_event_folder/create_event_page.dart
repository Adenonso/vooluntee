import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:vooluntee/my_widgets/colors.dart';
import 'package:vooluntee/my_widgets/my_buttons.dart';
import 'package:vooluntee/view/main_screens/select_screen.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  TextEditingController eventOrganizerController = TextEditingController();
  TextEditingController eventTitleController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController volNeededController = TextEditingController();
  late DateTime _dueDate;
  SizedBox autoSpace = SizedBox(
    height: 20,
  );

  @override
  void initState() {
    super.initState();
    _dueDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create Your Next Event',
          style: GoogleFonts.raleway(fontSize: 20),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SelectScreen()));
            },
            child: Icon(
              Iconsax.home,
              size: 23,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              autoSpace,
              //organizers name
              Text(
                'Event Organizer',
                style: GoogleFonts.raleway(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              TextField(
                controller: eventOrganizerController,
                obscureText: false,
                maxLines: 1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Event Organizer',
                  hintStyle: GoogleFonts.raleway(
                      fontSize: 14,
                      color: AppColors.neutralLight,
                      fontWeight: FontWeight.w500), //raleway font

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: AppColors
                            .neutralLight), // Red border when not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 2), // Red border when focused
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
              autoSpace,

              //the event title
              Text(
                'Event Title',
                style: GoogleFonts.raleway(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              TextField(
                controller: eventTitleController,
                obscureText: false,
                maxLines: 2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Event Title',
                  hintStyle: GoogleFonts.raleway(
                      fontSize: 14,
                      color: AppColors.neutralLight,
                      fontWeight: FontWeight.w500), //raleway font

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: AppColors
                            .neutralLight), // Red border when not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 2), // Red border when focused
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
              autoSpace,

              //event description
              Text(
                'Event Description',
                style: GoogleFonts.raleway(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              TextField(
                controller: eventDescriptionController,
                obscureText: false,
                maxLines: 5,
                maxLength: 150,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText:
                      'Event Title (Optional: Add Keywords like social, political, religious to appear in saerches)',
                  hintStyle: GoogleFonts.raleway(
                      fontSize: 14,
                      color: AppColors.neutralLight,
                      fontWeight: FontWeight.w500), //raleway font

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: AppColors
                            .neutralLight), // Red border when not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 2), // Red border when focused
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
              autoSpace,

              //the event location

              //the event date
              Text(
                'Event Date and Time',
                style: GoogleFonts.raleway(
                    fontSize: 15, fontWeight: FontWeight.w500),
              ),
              DueDateButton(
                initialDateTime: _dueDate,
                onDateTimeChanged: (value) {
                  // setState(() {
                  //   _dueDate = value;
                  //   widget.task.createdAt = value;
                  //   taskProvider.taskDb
                  //       .updateTaskdatabase(widget.index, widget.task);
                  // });
                },
              ),
              SizedBox(
                height: 30,
              ),

              //number of volunteers
              Text(
                'Number of Volunteers Needed',
                style: GoogleFonts.raleway(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              TextField(
                controller: volNeededController,
                obscureText: false,
                maxLines: 1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Input Number of Volunteers Needed',
                  hintStyle: GoogleFonts.raleway(
                      fontSize: 14,
                      color: AppColors.neutralLight,
                      fontWeight: FontWeight.w500), //raleway font

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: AppColors
                            .neutralLight), // Red border when not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 2), // Red border when focused
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
              autoSpace, autoSpace,

              //post event
              MyButtons(
                buttonText: 'Post',
                buttonBackgroundColor: AppColors.primary,
                buttonWidth: double.infinity * 0.2,
                buttonHeight: 40,
                buttonTextstyle: GoogleFonts.raleway(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.background),
              ),
              autoSpace,

              //a pictorial description or flyer
            ],
          ),
        ),
      ),
    );
  }
}

//due date button
class DueDateButton extends StatefulWidget {
  final DateTime initialDateTime;
  final ValueChanged<DateTime> onDateTimeChanged;
  const DueDateButton(
      {super.key,
      required this.initialDateTime,
      required this.onDateTimeChanged});

  @override
  State<DueDateButton> createState() => _DueDateButtonState();
}

class _DueDateButtonState extends State<DueDateButton> {
  late DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.initialDateTime;
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      );
      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
        widget.onDateTimeChanged(_selectedDateTime);
      } else {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            _selectedDateTime.hour,
            _selectedDateTime.minute,
          );
        });
        widget.onDateTimeChanged(_selectedDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('MMMM d, y').format(_selectedDateTime);
    final formattedTime = DateFormat('h:mm a').format(_selectedDateTime);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _selectDateTime(context),
            child: Center(child: Icon(Icons.calendar_month)),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formattedDate,
                style: GoogleFonts.raleway(
                  fontSize: 15,
                ),
              ),
              Text(
                formattedTime,
                style: GoogleFonts.raleway(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
