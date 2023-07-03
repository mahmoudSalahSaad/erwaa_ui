import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';



class MainPassField extends StatefulWidget {



  final String? hint ;
  final double? width ;
  final TextEditingController? controller ;
  final Function(String?)? onValidate ;
  final Function(String?)? onSave ;
  final Function(String?)? onChange;
  final bool ? obscure ; 
  const MainPassField({Key? key, this.hint, this.width, this.controller, this.onValidate, this.onSave, this.onChange, this.obscure}) : super(key: key);

  @override
  State<MainPassField> createState() => _MainPassFieldState();
}

class _MainPassFieldState extends State<MainPassField> {
  bool hide = true ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hide = widget.obscure! ;
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      width : widget.width??getProportionateScreenWidth(140),

      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15) ,
                offset: const Offset(0, 3) ,
                blurRadius: 58
            )
          ]
      ),
      child: Directionality(textDirection: TextDirection.rtl,

          child: TextFormField(
            controller: widget.controller,
            obscureText: hide,
            validator: (value) => widget.onValidate!(value),
            onChanged: (value)=> widget.onChange!(value),
            onSaved: (value) => widget.onSave!(value),
            decoration: InputDecoration(
                hintText: widget.hint??"" ,
                hintStyle: Constants.smallAuthText ,
                errorStyle: Constants.errorText,
                filled: true ,
                suffixIcon: GestureDetector(
                  onTap: (){
                    if(hide){
                      setState(() {
                        hide = false ;
                      });
                    }else{
                      setState(() {
                        hide = true ;
                      });
                    }
                  },
                  child: hide ? Image.asset("assets/icons/Vector.png" , scale: 4,width: getProportionateScreenWidth(20),) : const Icon(Icons.remove_red_eye_outlined , size: 20,),
                ),
                fillColor: Constants.kMainWhite ,

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                    borderSide: const BorderSide(color: Colors.transparent)
                ),

                contentPadding: EdgeInsets.symmetric(vertical: 0 , horizontal: getProportionateScreenWidth(10)) ,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                    borderSide: const BorderSide(color: Colors.transparent)
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                    borderSide: const BorderSide(color: Colors.transparent)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
                    borderSide: const BorderSide(color: Colors.transparent)
                )
            ),
          )),
    );
  }
}
