using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Fishing.MyPage
{
    /// <summary>
    /// Логика взаимодействия для ZakazPage.xaml
    /// </summary>
    public partial class ZakazPage : Page
    {
        List<MyModel.Material> _listMaterialZakaz = new List<MyModel.Material>();
        MyModel.Zakaz _currentZakaz = new MyModel.Zakaz();
       
        public ZakazPage(List<MyModel.Material> selectedListMatetial)
        {
            InitializeComponent();
            _listMaterialZakaz = selectedListMatetial;
            decimal sum = 0;
            var listPunkt = MyClass.ConnectDB.fishEntities.Pynct.ToList();
            listPunkt.Insert(0, new MyModel.Pynct
            {
                Address = "Не выбран"
            });

            CBPunck.ItemsSource = listPunkt;
           
            CBPunck.SelectedIndex = 0;
            LVMat.ItemsSource = _listMaterialZakaz;
            foreach(var su in _listMaterialZakaz)
            {
                sum += (decimal)(su.Count * su.Cost);
            }
            TBSum.Text = sum.ToString(); 
            //DataContext = selectedZakaz;

        }

        private void BTSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (CBPunck.SelectedIndex == 0)
            {
                errors.AppendLine("Выберите пункт Выдачи");
            }
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            MyModel.Pynct pynct = (CBPunck.SelectedItem) as MyModel.Pynct;
            _currentZakaz.IdUser = 5;
            _currentZakaz.Material = _listMaterialZakaz;
            _currentZakaz.IdPynct = pynct.IdPynct;
            _currentZakaz.Cost = Convert.ToDecimal(TBSum.Text);
            try
            {
                if(_currentZakaz.IdZakaz == 0)
                {
                    MyClass.ConnectDB.fishEntities.Zakaz.Add(_currentZakaz);
                    
                }
                MyClass.ConnectDB.fishEntities.SaveChanges();
                MessageBox.Show("T_T");
                MyClass.Manager.navFrame.GoBack();
                //foreach(var matList in _listMaterialZakaz)
                //{
                //    if()
                //}

            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
