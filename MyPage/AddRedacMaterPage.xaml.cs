using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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
    /// Логика взаимодействия для AddRedacMaterPage.xaml
    /// </summary>
    public partial class AddRedacMaterPage : Page
    {
        public AddRedacMaterPage()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFile = new OpenFileDialog
            {
                Filter = "Image File(*.PNG)|*.PNG"
            };
            if (openFile.ShowDialog() == true)
            {
                byte[] imageData = File.ReadAllBytes(openFile.FileName);
                MyModel.Type type = new MyModel.Type()
                {
                    Title = "asdas",
                    Image = imageData
                };
                MyClass.ConnectDB.fishEntities.Type.Add(type);
                MyClass.ConnectDB.fishEntities.SaveChanges();

            }
        }
    }
}
