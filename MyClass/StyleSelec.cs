using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace Fishing.MyClass
{
    public class StyleSelec : StyleSelector
    {
        public Style Low { get; set; }
        public Style Max { get; set; }

        public override Style SelectStyle(object item, DependencyObject container)
        {
            MyModel.Material material = (MyModel.Material)item;

            if (material.Count <= 0)
            {
                return Low;
            }

            return Max;
        }
    }
}
