
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/20/2018 19:00:42
-- Generated from EDMX file: C:\Users\Ingen\source\repos\Materiales_Hernandez_V2\Materiales_Hernandez_V2\Materiales_Hernandez_V2.Services.Entities\Entities\EntityModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Inventario];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cotización'
CREATE TABLE [dbo].[Cotización] (
    [IdCotizacion] int IDENTITY(1,1) NOT NULL,
    [FechaEmision] datetime  NOT NULL,
    [Condiciones] nvarchar(max)  NOT NULL,
    [Producto_IdProducto] int  NULL,
    [Clientes_Id_Cedula_Cliente] int  NOT NULL,
    [Empleadoes_IdEmpleado] int  NOT NULL
);
GO

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [Id_Cedula_Cliente] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Telefono] int  NOT NULL,
    [Direccion] nvarchar(max)  NOT NULL,
    [Correo_Electronico] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Pedidoes'
CREATE TABLE [dbo].[Pedidoes] (
    [IdPedido] int IDENTITY(1,1) NOT NULL,
    [FechaEmision] nvarchar(max)  NOT NULL,
    [CondPago] nvarchar(max)  NOT NULL,
    [Observaciones] nvarchar(max)  NOT NULL,
    [Empleadoes_IdEmpleado] int  NOT NULL,
    [Clientes_Id_Cedula_Cliente] int  NOT NULL,
    [Producto_IdProducto] int  NULL
);
GO

-- Creating table 'Productoes'
CREATE TABLE [dbo].[Productoes] (
    [IdProducto] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [PrecioVenta] float  NOT NULL,
    [Stock] int  NOT NULL
);
GO

-- Creating table 'Empleadoes'
CREATE TABLE [dbo].[Empleadoes] (
    [IdEmpleado] int IDENTITY(1,1) NOT NULL,
    [Nombres] nvarchar(max)  NOT NULL,
    [Apellidos] nvarchar(max)  NOT NULL,
    [Cargo] nvarchar(max)  NOT NULL,
    [FechaIngreso] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Comprobantes'
CREATE TABLE [dbo].[Comprobantes] (
    [IdComprobante] int IDENTITY(1,1) NOT NULL,
    [FechaEmision] datetime  NOT NULL,
    [Total] float  NOT NULL,
    [Producto_IdProducto] int  NOT NULL,
    [Empleadoes_IdEmpleado] int  NOT NULL,
    [Pedido_IdPedido] int  NOT NULL
);
GO

-- Creating table 'Comprobantes_Boleta'
CREATE TABLE [dbo].[Comprobantes_Boleta] (
    [NumeroBoleta] int  NOT NULL,
    [IdComprobante] int  NOT NULL
);
GO

-- Creating table 'Comprobantes_Factura'
CREATE TABLE [dbo].[Comprobantes_Factura] (
    [NroFactura] int  NOT NULL,
    [Subtotal] float  NOT NULL,
    [Fecha_Cancelacion] datetime  NOT NULL,
    [IdComprobante] int  NOT NULL
);
GO

-- Creating table 'Comprobantes_DetalleComprobante'
CREATE TABLE [dbo].[Comprobantes_DetalleComprobante] (
    [Cantidad] int  NOT NULL,
    [Impuesto] float  NOT NULL,
    [IdComprobante] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdCotizacion] in table 'Cotización'
ALTER TABLE [dbo].[Cotización]
ADD CONSTRAINT [PK_Cotización]
    PRIMARY KEY CLUSTERED ([IdCotizacion] ASC);
GO

-- Creating primary key on [Id_Cedula_Cliente] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([Id_Cedula_Cliente] ASC);
GO

-- Creating primary key on [IdPedido] in table 'Pedidoes'
ALTER TABLE [dbo].[Pedidoes]
ADD CONSTRAINT [PK_Pedidoes]
    PRIMARY KEY CLUSTERED ([IdPedido] ASC);
GO

-- Creating primary key on [IdProducto] in table 'Productoes'
ALTER TABLE [dbo].[Productoes]
ADD CONSTRAINT [PK_Productoes]
    PRIMARY KEY CLUSTERED ([IdProducto] ASC);
GO

-- Creating primary key on [IdEmpleado] in table 'Empleadoes'
ALTER TABLE [dbo].[Empleadoes]
ADD CONSTRAINT [PK_Empleadoes]
    PRIMARY KEY CLUSTERED ([IdEmpleado] ASC);
GO

-- Creating primary key on [IdComprobante] in table 'Comprobantes'
ALTER TABLE [dbo].[Comprobantes]
ADD CONSTRAINT [PK_Comprobantes]
    PRIMARY KEY CLUSTERED ([IdComprobante] ASC);
GO

-- Creating primary key on [IdComprobante] in table 'Comprobantes_Boleta'
ALTER TABLE [dbo].[Comprobantes_Boleta]
ADD CONSTRAINT [PK_Comprobantes_Boleta]
    PRIMARY KEY CLUSTERED ([IdComprobante] ASC);
GO

-- Creating primary key on [IdComprobante] in table 'Comprobantes_Factura'
ALTER TABLE [dbo].[Comprobantes_Factura]
ADD CONSTRAINT [PK_Comprobantes_Factura]
    PRIMARY KEY CLUSTERED ([IdComprobante] ASC);
GO

-- Creating primary key on [IdComprobante] in table 'Comprobantes_DetalleComprobante'
ALTER TABLE [dbo].[Comprobantes_DetalleComprobante]
ADD CONSTRAINT [PK_Comprobantes_DetalleComprobante]
    PRIMARY KEY CLUSTERED ([IdComprobante] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Producto_IdProducto] in table 'Comprobantes'
ALTER TABLE [dbo].[Comprobantes]
ADD CONSTRAINT [FK_ProductoComprobante]
    FOREIGN KEY ([Producto_IdProducto])
    REFERENCES [dbo].[Productoes]
        ([IdProducto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoComprobante'
CREATE INDEX [IX_FK_ProductoComprobante]
ON [dbo].[Comprobantes]
    ([Producto_IdProducto]);
GO

-- Creating foreign key on [Producto_IdProducto] in table 'Cotización'
ALTER TABLE [dbo].[Cotización]
ADD CONSTRAINT [FK_ProductoCotización]
    FOREIGN KEY ([Producto_IdProducto])
    REFERENCES [dbo].[Productoes]
        ([IdProducto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoCotización'
CREATE INDEX [IX_FK_ProductoCotización]
ON [dbo].[Cotización]
    ([Producto_IdProducto]);
GO

-- Creating foreign key on [Clientes_Id_Cedula_Cliente] in table 'Cotización'
ALTER TABLE [dbo].[Cotización]
ADD CONSTRAINT [FK_CotizaciónCliente]
    FOREIGN KEY ([Clientes_Id_Cedula_Cliente])
    REFERENCES [dbo].[Clientes]
        ([Id_Cedula_Cliente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CotizaciónCliente'
CREATE INDEX [IX_FK_CotizaciónCliente]
ON [dbo].[Cotización]
    ([Clientes_Id_Cedula_Cliente]);
GO

-- Creating foreign key on [Empleadoes_IdEmpleado] in table 'Cotización'
ALTER TABLE [dbo].[Cotización]
ADD CONSTRAINT [FK_CotizaciónEmpleado]
    FOREIGN KEY ([Empleadoes_IdEmpleado])
    REFERENCES [dbo].[Empleadoes]
        ([IdEmpleado])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CotizaciónEmpleado'
CREATE INDEX [IX_FK_CotizaciónEmpleado]
ON [dbo].[Cotización]
    ([Empleadoes_IdEmpleado]);
GO

-- Creating foreign key on [Empleadoes_IdEmpleado] in table 'Pedidoes'
ALTER TABLE [dbo].[Pedidoes]
ADD CONSTRAINT [FK_PedidoEmpleado]
    FOREIGN KEY ([Empleadoes_IdEmpleado])
    REFERENCES [dbo].[Empleadoes]
        ([IdEmpleado])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoEmpleado'
CREATE INDEX [IX_FK_PedidoEmpleado]
ON [dbo].[Pedidoes]
    ([Empleadoes_IdEmpleado]);
GO

-- Creating foreign key on [Clientes_Id_Cedula_Cliente] in table 'Pedidoes'
ALTER TABLE [dbo].[Pedidoes]
ADD CONSTRAINT [FK_PedidoCliente]
    FOREIGN KEY ([Clientes_Id_Cedula_Cliente])
    REFERENCES [dbo].[Clientes]
        ([Id_Cedula_Cliente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoCliente'
CREATE INDEX [IX_FK_PedidoCliente]
ON [dbo].[Pedidoes]
    ([Clientes_Id_Cedula_Cliente]);
GO

-- Creating foreign key on [Empleadoes_IdEmpleado] in table 'Comprobantes'
ALTER TABLE [dbo].[Comprobantes]
ADD CONSTRAINT [FK_ComprobanteEmpleado]
    FOREIGN KEY ([Empleadoes_IdEmpleado])
    REFERENCES [dbo].[Empleadoes]
        ([IdEmpleado])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ComprobanteEmpleado'
CREATE INDEX [IX_FK_ComprobanteEmpleado]
ON [dbo].[Comprobantes]
    ([Empleadoes_IdEmpleado]);
GO

-- Creating foreign key on [Pedido_IdPedido] in table 'Comprobantes'
ALTER TABLE [dbo].[Comprobantes]
ADD CONSTRAINT [FK_PedidoComprobante]
    FOREIGN KEY ([Pedido_IdPedido])
    REFERENCES [dbo].[Pedidoes]
        ([IdPedido])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoComprobante'
CREATE INDEX [IX_FK_PedidoComprobante]
ON [dbo].[Comprobantes]
    ([Pedido_IdPedido]);
GO

-- Creating foreign key on [Producto_IdProducto] in table 'Pedidoes'
ALTER TABLE [dbo].[Pedidoes]
ADD CONSTRAINT [FK_ProductoPedido]
    FOREIGN KEY ([Producto_IdProducto])
    REFERENCES [dbo].[Productoes]
        ([IdProducto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoPedido'
CREATE INDEX [IX_FK_ProductoPedido]
ON [dbo].[Pedidoes]
    ([Producto_IdProducto]);
GO

-- Creating foreign key on [IdComprobante] in table 'Comprobantes_Boleta'
ALTER TABLE [dbo].[Comprobantes_Boleta]
ADD CONSTRAINT [FK_Boleta_inherits_Comprobante]
    FOREIGN KEY ([IdComprobante])
    REFERENCES [dbo].[Comprobantes]
        ([IdComprobante])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdComprobante] in table 'Comprobantes_Factura'
ALTER TABLE [dbo].[Comprobantes_Factura]
ADD CONSTRAINT [FK_Factura_inherits_Comprobante]
    FOREIGN KEY ([IdComprobante])
    REFERENCES [dbo].[Comprobantes]
        ([IdComprobante])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdComprobante] in table 'Comprobantes_DetalleComprobante'
ALTER TABLE [dbo].[Comprobantes_DetalleComprobante]
ADD CONSTRAINT [FK_DetalleComprobante_inherits_Comprobante]
    FOREIGN KEY ([IdComprobante])
    REFERENCES [dbo].[Comprobantes]
        ([IdComprobante])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------