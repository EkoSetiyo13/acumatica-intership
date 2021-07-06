using PX.Data;

namespace PhoneRepairShop
{
    [PXCacheName("Serviced Device")]
    public class RSSVDevice : IBqlTable
    {
        #region DeviceID
        [PXDBIdentity]
        public virtual int? DeviceID { get; set; }
        public abstract class deviceID : PX.Data.BQL.BqlInt.Field<deviceID> { }
        #endregion


        #region DeviceCD
        [PXDBString(15, IsUnicode = true, IsKey = true)]
        [PXDefault]
        [PXUIField(DisplayName = "Device Code")]
        [PXSelector(typeof(Search<RSSVDevice.deviceCD>),
         typeof(RSSVDevice.deviceCD),
         typeof(RSSVDevice.active),
         typeof(RSSVDevice.avgComplexityOfRepair))]
        public virtual string DeviceCD { get; set; }
        public abstract class deviceCD : PX.Data.BQL.BqlString.Field<deviceCD> { }
        #endregion

        #region Description
        [PXDBString(256, IsUnicode = true, InputMask = "")]
        [PXUIField(DisplayName = "Description")]
        public virtual string Description { get; set; }
        public abstract class description :
         PX.Data.BQL.BqlString.Field<description>
        { }
        #endregion

        #region Active
        [PXDBBool()]
        [PXDefault(true)]
        [PXUIField(DisplayName = "Active")]
        public virtual bool? Active { get; set; }
        public abstract class active : PX.Data.BQL.BqlBool.Field<active> { }
        #endregion

        #region AvgComplexityOfRepair
        [PXDBString(1, IsFixed = true)]
        [PXDefault(RepairComplexity.Medium)]
        [PXUIField(DisplayName = "Complexity")]
        [PXStringList(
         new string[]
         {
             RepairComplexity.Low,
             RepairComplexity.Medium,
             RepairComplexity.High
         },
         new string[]
         {
            Messages.Low, Messages.Medium, Messages.High
         })]
        public virtual string AvgComplexityOfRepair { get; set; }
        public abstract class avgComplexityOfRepair :
         PX.Data.BQL.BqlString.Field<avgComplexityOfRepair>
        { }
        #endregion
    }
}
