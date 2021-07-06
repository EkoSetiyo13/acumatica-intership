using System;
using PX.Data;


namespace PhoneRepairShop
{
  [PXCacheName("Repair Service")]
  public class RSSVRepairService : IBqlTable
  {
    #region ServiceID
    [PXDBIdentity]
    public virtual int? ServiceID { get; set; }
    public abstract class serviceID : PX.Data.BQL.BqlInt.Field<serviceID> { }
    #endregion

    #region ServiceCD
    [PXDBString(255, InputMask = "",IsKey = true)]
    [PXDefault]
    [PXUIField(DisplayName = "Service ID")]
    public virtual string ServiceCD { get; set; }
    public abstract class serviceCD : PX.Data.BQL.BqlString.Field<serviceCD> { }
    #endregion

    #region Description
    [PXDBString(255, IsUnicode = true, InputMask = "")]
    [PXDefault("")]
    [PXUIField(DisplayName = "Description")]
    public virtual string Description { get; set; }
    public abstract class description : PX.Data.BQL.BqlString.Field<description> { }
    #endregion

    #region Active
    [PXDBBool()]
    [PXDefault(true)]
    [PXUIField(DisplayName = "Active")]
    public virtual bool? Active { get; set; }
    public abstract class active : PX.Data.BQL.BqlBool.Field<active> { }
    #endregion

    #region WalkInService
    [PXDBBool()]
    [PXDefault(false)]
    [PXUIField(DisplayName = "Walk-In Service")]
    public virtual bool? WalkInService { get; set; }
    public abstract class walkInService : PX.Data.BQL.BqlBool.Field<walkInService> { }
    #endregion

    #region PreliminaryCheck
    [PXDBBool()]
    [PXDefault(false)]
    [PXUIField(DisplayName = "Requires Preliminary Check")]
    public virtual bool? PreliminaryCheck { get; set; }
    public abstract class preliminaryCheck : PX.Data.BQL.BqlBool.Field<preliminaryCheck> { }
    #endregion

    #region Prepayment
    [PXDBBool()]
    [PXDefault(false)] 
    [PXUIField(DisplayName = "Requires Prepayment")]
    public virtual bool? Prepayment { get; set; }
    public abstract class prepayment : PX.Data.BQL.BqlBool.Field<prepayment> { }
    #endregion
  }
}