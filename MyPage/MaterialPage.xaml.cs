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
    /// Логика взаимодействия для MaterialPage.xaml
    /// </summary>
    public partial class MaterialPage : Page
    {
        int _countInPage = 6;
        int _currentPage = 1;
        int _maxPage;
        List<MyModel.Material> _listMaterialZakaz = new List<MyModel.Material>();
        public MaterialPage(MyModel.User selectedUser)
        {
            InitializeComponent();
            RefreshDate();
            var listType = MyClass.ConnectDB.fishEntities.Type.ToList();
            CBCount.Items.Insert(0, "Не Выбрано");
            CBCount.Items.Insert(1, "По Возрастанию");
            CBCount.Items.Insert(2, "По Убыванию");
            CBCost.Items.Insert(0, "Не Выбрано");
            CBCost.Items.Insert(1, "По Возрастанию");
            CBCost.Items.Insert(2, "По Убыванию");
            listType.Insert(0, new MyModel.Type
            {
                Title = "Не Выбрано"
            });
            CBType.ItemsSource = listType;
            CBType.SelectedIndex = 0;
            CBCost.SelectedIndex = 0;
            CBCount.SelectedIndex = 0;
            TeBFirst.TextDecorations = TextDecorations.Underline;
            TeBCost.Text = $"Общая сумма на странице: {selectedUser.FirstName} {selectedUser.LastName} {selectedUser.SurName}"; /// //////////////////////////////////////////////////
        }

        private void RefreshDate()
        {
            List<MyModel.Material> listMaterial = MyClass.ConnectDB.fishEntities.Material.ToList();
            listMaterial = ListMater();

            _maxPage = (int)Math.Ceiling(listMaterial.Count()*1.0 / _countInPage);
            


            TeBNaim.Text = "Всего наименований" + listMaterial.Count().ToString();
            

            listMaterial = listMaterial.Skip((_currentPage - 1) * _countInPage).Take(_countInPage).ToList();

            if(_currentPage > 1 && _currentPage < _maxPage - 3)
            {
                TeBFirst.Text = (_currentPage - 1).ToString();
                TeBSecond.Text = _currentPage.ToString();
                TeBTherd.Text = (_currentPage + 1).ToString();
                TeBFour.Text = (_currentPage + 2).ToString();
                TeBSecond.TextDecorations = TextDecorations.Underline;
            }
            else if (_currentPage == _maxPage - 3)
            {
                TeBFirst.Text = (_maxPage - 4).ToString();
                TeBSecond.Text = (_maxPage - 3).ToString();
                TeBTherd.Text = (_maxPage - 2).ToString();
                TeBFour.Text = (_maxPage - 1).ToString();
                TeBSecond.TextDecorations = TextDecorations.Underline;
            }
            else if(_currentPage > _maxPage - 3 && _maxPage > 3)
            {
                TeBFirst.Text = (_maxPage - 3).ToString();
                TeBSecond.Text = (_maxPage - 2).ToString();
                TeBTherd.Text = (_maxPage -1).ToString();
                TeBFour.Text = (_maxPage).ToString();
                TeBSecond.TextDecorations = TextDecorations.Underline;
            }
           
            if (_currentPage == 1)
            {
                UnderLine();
                TeBFirst.TextDecorations = TextDecorations.Underline;
            }
            if (_currentPage == _maxPage - 1)
            {
                UnderLine();
                TeBTherd.TextDecorations = TextDecorations.Underline;
            }
            if (_currentPage == _maxPage)
            {
                UnderLine();
                TeBFour.TextDecorations = TextDecorations.Underline;
            }
            if(_maxPage < 4)
            {
                TeBFour.Text = "";
                TeBFirst.Text = "1";
                TeBSecond.Text = "2";
                TeBTherd.Text = "3";
            }
            if (_maxPage < 3)
            {
                TeBTherd.Text = "";
                TeBFirst.Text = "1";
                TeBSecond.Text = "2";
              
            }
            if (_maxPage < 2)
            {
                TeBSecond.Text = "";
            }


            LV.ItemsSource = listMaterial;
        }
        private void UnderLine()
        {
            TeBFirst.TextDecorations = null;
            TeBSecond.TextDecorations = null;
            TeBTherd.TextDecorations = null;
            TeBFour.TextDecorations = null;
        }

        private List<MyModel.Material> ListMater()
        {
            List<MyModel.Material> listMater = MyClass.ConnectDB.fishEntities.Material.ToList();

            listMater = listMater.FindAll(x => x.Title.ToLower().Contains(TBSeach.Text.ToLower()));

            if (CBType.SelectedIndex > 0)
            {
                MyModel.Type type = (CBType.SelectedItem) as MyModel.Type;
                listMater = listMater.FindAll(x => x.IdType == type.IdType);
            }
            if (CBCost.SelectedIndex > 0)
            {
                if(CBCost.SelectedIndex == 1)
                {
                    listMater = listMater.OrderBy(x => x.Cost).ToList();
                }
                else
                {
                    listMater = listMater.OrderByDescending(x => x.Cost).ToList();
                }
                
            }
            if (CBCount.SelectedIndex > 0)
            {
                if (CBCount.SelectedIndex == 1)
                {
                    listMater = listMater.OrderBy(x => x.Cost).ToList();
                }
                else
                {
                    listMater = listMater.OrderByDescending(x => x.Cost).ToList();
                }

            }

            

            return listMater;
        }

        private void BTRed_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BTDelet_Click(object sender, RoutedEventArgs e)
        {
            var delet = (sender as Button).DataContext as MyModel.Material;
            var listMat = MyClass.ConnectDB.fishEntities.Material.ToList();
            if(MessageBox.Show($"Вы действительно хотете удалить {delet.Title}", "Warning", 
                MessageBoxButton.YesNo, MessageBoxImage.Question,MessageBoxResult.No)== MessageBoxResult.Yes)
            {
                listMat.Remove(delet);
                MyClass.ConnectDB.fishEntities.SaveChanges();
                MyClass.ConnectDB.fishEntities.ChangeTracker.Entries().ToList().ForEach(x => x.Reload());
                MessageBox.Show("Delete Sucsess");
                RefreshDate();
            }
        }

        private void TBNazad_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if(_currentPage > 1)
            {
                _currentPage--;
                UnderLine();
            }
            RefreshDate();
        }

        private void TBFirst_MouseDown(object sender, MouseButtonEventArgs e)
        {
            _currentPage = Convert.ToInt32(TeBFirst.Text);
            RefreshDate();
        }

        private void TBSecond_MouseDown(object sender, MouseButtonEventArgs e)
        {
            _currentPage = Convert.ToInt32(TeBFirst.Text);
            RefreshDate();
            
        }

        private void TBTherd_MouseDown(object sender, MouseButtonEventArgs e)
        {
            _currentPage = Convert.ToInt32(TeBFirst.Text);
            RefreshDate();
            
        }

        private void TBFour_MouseDown(object sender, MouseButtonEventArgs e)
        {
            _currentPage = Convert.ToInt32(TeBFirst.Text);
            RefreshDate();
            if (_currentPage == _maxPage)
            {
                UnderLine();
                TeBFour.TextDecorations = TextDecorations.Underline;
            }
        }

        private void TBNext_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (_currentPage < _maxPage)
            {
                _currentPage++;
                UnderLine();
            }
            RefreshDate();
        }

        private void BTClear_Click(object sender, RoutedEventArgs e)
        {

        }

        private void CBType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            RefreshDate();
        }

        private void CBCount_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            RefreshDate();
        }

        private void CBCost_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            RefreshDate();
        }

        private void TBSeach_TextChanged(object sender, TextChangedEventArgs e)
        {
            RefreshDate();
        }

        private void BTDobav_Click(object sender, RoutedEventArgs e)
        {
            var a = (sender as Button).DataContext as MyModel.Material;
            if(_listMaterialZakaz.Where(x => x.IdMaterial == a.IdMaterial).Count() != 0)
            {
                if (_listMaterialZakaz.Find(x => x.IdMaterial == a.IdMaterial).Count > 0)
                {
                    a.Count = _listMaterialZakaz.Find(x => x.IdMaterial == a.IdMaterial).Count;
                    a.Count++;
                    
                }
                
            }
            else
            {
                a.Count = 1;
                _listMaterialZakaz.Add(a);
            }

        }

        private void BTCpicosk_Click(object sender, RoutedEventArgs e)
        {
            if(_listMaterialZakaz == null)
            {
                MessageBox.Show("Нет заказов");
                return;
            }
            MyClass.Manager.navFrame.Navigate(new MyPage.ListZakazPage(_listMaterialZakaz));
        }

        private void BTZakaz_Click(object sender, RoutedEventArgs e)
        {
            if(_listMaterialZakaz == null)
            {
                MyClass.Manager.navFrame.Navigate(new MyPage.ZakazPage(_listMaterialZakaz));
            }
            
        }

        private void BTZakazView_Click(object sender, RoutedEventArgs e)
        {
            if (_listMaterialZakaz == null)
            {
                MyClass.Manager.navFrame.Navigate(new MyPage.ZakazViewPage());
            }
        }
    }
}
