import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {

  final String? hint ;
  final double? width ;
  final TextEditingController? controller ;
  final Function(String?)? onValidate ;
  final Function(String?)? onSave ;
  final Function(String?)? onChange;
  const MainTextField({
    super.key, this.hint, this.width, this.controller, this.onValidate, this.onSave, this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width : width??getProportionateScreenWidth(140) ,

      
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
            controller: controller,
            validator: (value) => onValidate!(value),
            onChanged: (value)=> onChange!(value),
            onSaved: (value) => onSave!(value),
            decoration: InputDecoration(
                hintText: hint??"الاسم الاول" ,
                hintStyle: Constants.smallAuthText ,
                filled: true ,
                errorStyle: Constants.errorText,
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
                ),

            ),
          )),
    );
  }
}
