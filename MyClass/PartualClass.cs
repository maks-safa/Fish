using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fishing.MyModel
{
    public partial class Material
    {
        public double Price
        {
            get
            {
                return (double)(Count * Cost);
            }
        }
    }
}
