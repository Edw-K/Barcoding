#declare colorneed(FldCondition)
{Font={BackColor=if(#FldCondition,ColorNeed,0)}}
#end
Window wnSHK_getParameter '������஢���� ��ࠬ��஢ ��ꥪ� ��' ;
//Show at (3,5,120,28);
//---------------------------------------------
Screen SHK_getParameter (,,Sci178Esc);
//Show at (,,,2);
Table SHKObj;
Fields
 SHKObj.code        : skip, #colorneed(SHKObj.code='');
 SHKObj.Name        : skip, #colorneed(SHKObj.Name='');
 tTypeObjWin.name   : skip, #colorneed(not isvalidall(tntTypeObjWin));
 SHKObj.SYSNAMETBL+'.'+SHKObj.SYSNAME  : skip, #colorneed(SHKObj.SYSNAMETBL = '' or SHKObj.SYSNAME = '');
 SHKObj.Action ('�������� �����䨪��� (�� ���� ���� ᮯ��⠢�����, �� ������ ����訢�����)'): Skip, #colorneed(SHKObj.Action='');
 _Ident            : Noprotect, #colorneed(_Ident = '');
  co_BatchMode     : skip;
 _FileIN : Protect, Pickbutton;
buttons
  cmValue1,,,'��ନ஢��� JSON OBJECTDESCRIPTION',,;
  cmValue2,,,'��ନ஢��� JSON OBJECTVALUES',,;
  cmValue3,,,'����㧨�� JSON',,;
<<
 `���` .@@@@@@@ `������������`.@@@@@@@@@@@@@@@@@@@@@@@    ��� ���㬥�� .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ���� �����䨪�樨 ��ꥪ� .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 `�����䨪��� OBJECTACTION`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

     `������ �����䨪���` .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ (��� ����⭮� ���㧪� ����� .@@@@@@@@@@@)

    <.��ନ஢��� JSON OBJECTDESCRIPTION.>      <.��ନ஢��� JSON OBJECTVALUES.>

�஢�ઠ ����㧪� ����������� 䠩�� JSON:
    䠩� .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    <.����㧨��.>

>>
end;//Screen ScrRaiseEdit
end;
windowevent wnSHK_getParameter ;
cmValue1: {
 var _JSONfile : string = GenerateJSON_DescriptionFILE(SHKObj.Action);

 processtext(_JSONfile, vfNewTitle Or vfMacroSize, '������஢���� JSON OBJECTDESCRIPTION');

}
cmValue2: {


 if wgettune('SHK.CONNECTIONTYPE') = 0 {
    var _JSONfile : string = GenerateJSON_VALUESFILE(SHKObj.Action, _Ident);
    processtext(_JSONfile, vfNewTitle Or vfMacroSize, '������஢���� JSON OBJECTVALUES');
   }
   else {
   var _isPathOK   : boolean = checkDestPathfromTune;
    generate_batch_files_group_TSD_ARM_USER(SHKObj.Action);
    if _isPathOK then
      message('����� ���㦥�� � ����� "' +
       ''#13'' + get_destFolder + '"');
   }
}
cmValue3: {
 if _FileIN = '' then {
   message('�롥�� 䠩�',error);
   stop; abort; exit
 }
 var _JSONfile : string = MakeAction_FromJSONFILE('TEST','TEST',_FileIN);
 processtext(_JSONfile, vfNewTitle Or vfMacroSize, '�⢥� �� ����㧪� JSON');
}
end;
