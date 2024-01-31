#declare windowevent(WindowName, objmarker,ImportFromName)
WindowEvent #WindowName;
CmInit: {
   SetWindowTitle(#WindowName,'�롮� '+tTypeObj_select.name);
   #objmarker.UnselectAll;
   if #ImportFromName <> '' then #objmarker.ImportFromName(#ImportFromName)
}
cmDefault: {
  if (#objmarker.Count=0) then #objmarker.Mark;
  var _tmpMarker : tpTr = InitMarker( co_MarkerName, 8, 100, 10 );
  ClearMarker(_tmpMarker);
   #objmarker.ExportTo(_tmpMarker);
  DoneMarker( _tmpMarker, co_MarkerName);
  closewindow(#WindowName);
}
end;
#end

Window winKS_SELECT '�롮� ���������', cyan;
browse brKS_SELECT;
 table KS_SELECT;
  recMarker = pMarkerKS;
  Fields
   KS_SELECT.DesGr  '��㯯�','���ਯ�஢' : [2] , Protect, NoPickButton;
   KS_SELECT.Descr  '���ਯ��'            : [3] , Protect, nopickbutton;
   ks_Note.sNAME     '�����'                 : [6] , Protect, NoPickButton;
   KS_SELECT.Nsopr  '�����'                 : [6] , Protect, NoPickButton;
   KS_SELECT.dSopr  '���'                 : [4] , Protect, nopickbutton;
   KS_SELECT.dOpr   '���','���室������' : [10], Protect, nopickbutton;
   KS_SELECT.name   '�ਬ�砭��'           : [10], Protect, nopickbutton;
   ks_Org.name              '�࣠������'          : [10], Protect, nopickbutton;
   ks_PodrFrom.kod          '����. ��㤠','���'          : [3], Protect, nopickbutton;
   ks_PodrFrom.name         '����. ��㤠','������������' : [10], Protect, nopickbutton;
   ks_PodrTo.kod            '����. �㤠','���'          : [3], Protect, nopickbutton;
   ks_PodrTo.name           '����. �㤠','������������' : [10], Protect, nopickbutton;
   ks_MolFrom.kod           '��� ��㤠','���'          : [3], Protect, nopickbutton;
   ks_MolFrom.name          '��� ��㤠','������������' : [10], Protect, nopickbutton;
   ks_MolTo.kod             '��� �㤠','���'          : [3], Protect, nopickbutton;
   ks_MolTo.name            '��� �㤠','������������' : [10], Protect, nopickbutton;
end;
end;
#windowevent(winKS_SELECT, pMarkerKS,'')

Window winINV_SELECT '�롮� ������ਧ�樨', cyan;
browse brINV_SELECT;
 table INV_SELECT;
  recMarker = pMarkerINV;
  Fields
  INV_SELECT.desGr  '��㯯�'    ('��� ��㯯� ���짮��⥫��')            : [ 6], Protect, nopickbutton;
  INV_SELECT.descr  '����.' ('���ਯ��(�����䨪���) ���짮��⥫�') : [ 6], Protect, nopickbutton;
  INV_NOTE.sName    '�����'                                       : [10], Protect,     nopickbutton;
  INV_SELECT.nInv   '�����'     ('����� ������ਧ�樨')           : [10], Protect,      nopickbutton;
  INV_SELECT.dInv   '��� ���.' ('��� �஢������ ������ਧ�樨') : [10], Protect,      nopickbutton;
  inv_podr.kod      '����� ���'     ('��� ᪫���'           )      : [5], Protect,       nopickbutton;
  inv_podr.Name     '�����'     ('������������ ᪫���'           ) : [40], Protect,      nopickbutton;
  inv_mol.kod       '��� ���'       ('���ਠ�쭮 �⢥��⢥���� ��� ���') : [5], Protect,nopickbutton;
  inv_mol.name      '���'       ('���ਠ�쭮 �⢥��⢥���� ���') : [30], Protect,       nopickbutton;
end;
end;
#windowevent(winINV_SELECT, pMarkerINV,'')

Window winKATBOX_SELECT '�롮� �祥�', cyan;
browse brKATBOX_SELECT;
 table KATBOX_SELECT;
  recMarker = pMarkerBox;
 Fields
  KATBOX_SELECT.Name '������������ �祩��' ('������������ �祩��', , ) : [20], Protect, nopickbutton;
  KATBOX_SELECT.KOD  '��� �祩��' ('��� �祩��', , ) : [10], Protect, nopickbutton;
  Box_podr.kod       '���ࠧ�������','���'           : [10], Protect, nopickbutton;
  Box_podr.name      '���ࠧ�������','������������'  : [20], Protect, nopickbutton;
  KATBOX_SELECT.volume      '��ꥬ �祩��'                  : [10.3, '\3p[|-]6`666`666`666`666.888'], Protect, nopickbutton;
  TekBox.volume      '��������� ��ꥬ�'              : [10.3, '\3p[|-]6`666`666`666`666.888'], Protect, nopickbutton;
  Box_mc.barkod      '��१�ࢨ஢��� �� ��','���'      : [10], Protect, nopickbutton;
  Box_mc.Name        '��१�ࢨ஢��� �� ��','������������'      : [20], Protect, nopickbutton;
end;
end;
#windowevent(winKATBOX_SELECT, pMarkerBox,co_MarkerNameExportSaldoBox)

Window winAddNewBarcodes '��ନ஢���� ����� ���媮���' ;
Screen scrAddNewBarcodes '��ନ஢���� ����� ���媮���';
Fields
 __wTable         : Protect, PickButton;
 //__TidkGal        : Protect, PickButton;
 tTypeObj_select.name : Protect, PickButton;
 __SelectedObject : Protect, pickButton;
Buttons
 cmValue1,,,;
 cmCancel,,,;
<<'��ନ஢���� ����� ���媮���'

      ������.@@@@@@@@@@@@@@@@@@@@@@@@
��� ���㬥��.@@@@@@@@@@@@@@@@@@@@@@@@

    ��ꥪ��  .@@@@@@@@@@@@@@@@@@@@@@@@

  <. ������� .>  <. �⬥��.>
>>
end;
end;

windowevent winAddNewBarcodes ;
  cmInit: {
     var _tmpMarker : tpTr = InitMarker( co_MarkerName, 8, 100, 10 );
     ClearMarker( _tmpMarker );
     DoneMarker( _tmpMarker, co_MarkerName);
     set __TidkGal   := 0;
     set __SelectedObject := '';
 }
 cmDelOnProtect: {
   case curfield of #__SelectedObject : __SelectedObject  := ''; end;
 }
 cmpick: {
   case curfield of
    #__TidkGal, #__wTable,  #tTypeObj_select.name: {
       if __SelectedObject <> '' {
         Message('���砫� 㤠��� ��࠭�� ��ꥪ��', error);
         stop; abort; exit;
       }
      var _iSHK_TEMPLATES : SHK_TEMPLATES new;
      set __TidkGal := _iSHK_TEMPLATES.SelectVIDDOC;
    }
    #__SelectedObject: {

        if __wTable = 0 and __TidkGal = 0 then  {
           Message('�롥�� ᭠砫� ⨯ ���㬥��', error);
           stop; abort; exit;
         }

      set __SelectedObject := SelectObjects;
    }
   end;
 }
 cmValue1: {
   if __SelectedObject = '' then {
     Message('�� �� ��ࠬ���� 㪠����', error);
     stop; abort; exit;
   }
  closewindowex(winAddNewBarcodes, cmDefault);
 }
end;

Window winSelectTSDARMUSER '�롮�', doAccept;
//---------------------------------------------
Browse brSelectTSDARMUSER (,,Sci1Esc);
  Table SHK_Browse;
  fields {Font={Color=if(not SHK_Browse.IsActive,ColorGray,0)}};
   SHK_Browse.ID          '���' ('�����䨪��� ') : [ 6], Protect, nopickbutton;
   SHK_Browse.name        '������������' ('������������') : [ 6], Protect, nopickbutton;
   SHK_Browse.Description '���ᠭ��'('���ᠭ��') : [ 10], Protect, nopickbutton;
   SHK_Browse.IsActive    '��⨢��'('�ਧ��� ��⨢����') : [ 2], Protect, checkBox;
 end;
end;

Function selectTSDARMUSER(_TSDARMUSER: word; _curvalue : comp): comp;
{
  set _pTypeTSDARMUSER := _TSDARMUSER;
  result := _curvalue;
  if runWindowModal(winSelectTSDARMUSER) = cmDefault then {
      result := SHK_Browse.nrec;
    }
}

Window winshk_barcodeLink '��ᬮ��/ᮧ����� ���媮���' ;
//---------------------------------------------
Browse brSshk_barcodeLink (,,Sci17Esc);
Table shk_barcodeLink;
  recMarker = pMarkerBarCodeLink;
Fields //{font = {color= if(SHKObjSP_HEAD.WISACTIVE = 0,colorsysgray,0)}};
// shk_barcodeLink.wTable     '��� ⠡����'                    ('��� ⠡����'                  ) : [3] ,Protect, NoDel;
 x$files.xf$name            '������'                        ('������ ������������'                  ) : [3] ,Protect, NoDel;
// shk_barcodeLink.tiDkGal    '���⥬�� ��� ⨯� ���㬥��'   ('���⥬�� ��� ⨯� ���㬥��' ) : [3] ,Protect, NoDel;
 tTypeObj.name               '��� ���㬥��'                  ('⨯ ���㬥��' ) : [3] ,Protect, NoDel;
// shk_barcodeLink.cRec       '��뫪� �� ��ꥪ�'               ('��뫪� �� ��ꥪ�'             ) : [4] ,Protect, NoDel;
 ObjectString               '��ꥪ�'                         ('��뫪� �� ��ꥪ�'             ) : [4] ,Protect, NoDel;
 shk_barcodeLink.barcode    '���� ��� ���㬥��'            ('���� ��� ���㬥��'          ) : [5] ,Protect, NoDel;
 shk_barcodeLink.type       '��� ��: 0 - ᢮�, 1 - ���譨�'  ('��� ��: 0 - ᢮�, 1 - ���譨�') : [3] ,Protect, NoDel;
 [SHK_TSD_name] SHK_TSD.name + '(' +SHK_TSD.id+ ')'  '���'            ('������� ��� ��� ��।�� ���।�⢮� USB') : [5] ,Protect, PickButton;
 [SHK_ARM_name] SHK_ARM.name + '(' +SHK_ARM.id+ ')' '���'            ('������� ��� ��� ��।�� ���।�⢮� USB') : [5] ,Protect, PickButton;
 [SHK_USER_name] SHK_USER.name + '(' +SHK_USER.id+ ')' '���짮��⥫�'   ('������� ���짮��⥫� ��� ��।�� ���।�⢮� USB') : [5] ,Protect, PickButton;

end;//Browse brNormPercent
end;

windowevent winshk_barcodeLink;
 cmPick: {
   case curfield of
   #SHK_TSD_name  : shk_barcodeLink.cTSD  := selectTSDARMUSER(1,shk_barcodeLink.cTSD);
   #SHK_ARM_name  : shk_barcodeLink.cARM  := selectTSDARMUSER(2,shk_barcodeLink.cARM );
   #SHK_USER_name : shk_barcodeLink.cUser := selectTSDARMUSER(3,shk_barcodeLink.cUser);
  end;
  update current shk_barcodeLink;
  rereadrecord;
 }
 cminsert: {
  AddNewBarcodes;
  rereadrecord;
 }
 cmdelonprotect:{
   case curfield of
   #SHK_TSD_name  : shk_barcodeLink.cTSD  := 0h;
   #SHK_ARM_name  : shk_barcodeLink.cARM  := 0h;
   #SHK_USER_name : shk_barcodeLink.cUser := 0h;
  end;
  update current shk_barcodeLink;
  rereadrecord;

 }
 cmPrintDoc: {
//        message(pMarkerBarCodeLink.count);
        if pMarkerBarCodeLink.count = 0
         {
           var _ishk_barcode_Print : shk_barcode_Print;
            _ishk_barcode_Print.PrintByBarCode(shk_barcodeLink.barcode,shk_barcodeLink.type,'');
         }
         else {

             var _tmpMarker : tpTr = InitMarker( 'PrintSeveralBarcodes', 8, 100, 10 );
              ClearMarker(_tmpMarker);
               pMarkerBarCodeLink.ExportTo(_tmpMarker);
              DoneMarker( _tmpMarker, 'PrintSeveralBarcodes');
              pMarkerBarCodeLink.UnselectAll;
            var _TpTunePrintGen : TpTunePrintGen;
              clearadvrecord(_TpTunePrintGen);
              rescanpanel(tnshk_barcodeLink);
             var ishk_barcode_Print :shk_barcode_Print;
               ishk_barcode_Print.PrintByMarkerBarcodeLink('PrintSeveralBarcodes', _TpTunePrintGen, '');
           }

    }
 cmValue1 : {
   if not isvalidall(tnshk_barcodeLink) then exit;
   var _ishk_barcode_Print : shk_barcode_Print;
    _ishk_barcode_Print.TunePrint(shk_barcodeLink.wTable, shk_barcodeLink.tidkGal);

 }
 cmValue2 : {
   if not isvalidall(tnshk_barcodeLink) then exit;
    _iShk_BarcodeFunc.show_doc(shk_barcodeLink.TidkGal, shk_barcodeLink.crec);

 }

 cmHotKeys : {
    PutHotCommand(runMenu('mnu_shk_barcode_Generate'));
 }

end;
